import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../../catalog/presentation/bloc/catalog_cubit.dart';
import '../../listings/presentation/bloc/listings_cubit.dart';
import '../../catalog/data/models/category_model.dart';
import '../../listings/data/models/listing_model.dart';
import '../../product_details/view/product_details.dart';
import '../../favorite/presentation/bloc/favorite_cubit.dart';
import '../../promotions/presentation/bloc/promotions_cubit.dart';
import '../../promotions/presentation/pages/promotion_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // No longer using hardcoded slideritem

  @override
  void initState() {
    super.initState();
    final listingsCubit = context.read<ListingsCubit>();
    listingsCubit.resetAllFilters();
    context.read<CatalogCubit>().fetchCatalog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final name = state is AuthAuthenticated ? state.user.name : "guest".tr();
            return Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/logo/homelogo.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('welcome'.tr(), style: const TextStyle(color: Colors.grey, fontSize: 14)),
                    Text(name, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const Spacer(),
                _buildAppBarIcon(Icons.search, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()))),
                const SizedBox(width: 8),
                _buildAppBarIcon(Icons.notifications_none_rounded, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Natifiation()))),
              ],
            );
          },
        ),
      ),
      body: RefreshIndicator(
        color: Colors.green,
        onRefresh: () async {
          context.read<CatalogCubit>().fetchCatalog();
          context.read<ListingsCubit>().fetchPublicListings();
          context.read<PromotionsCubit>().fetchPromotions();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("category".tr(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen())),
                      child: Text("see_all".tr(), style: const TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              _buildCategories(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("exclusive_offers".tr(), style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 14)),
                    Text("fresh_crops".tr(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
              ),
              _buildListings(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.green, size: 24),
        onPressed: onTap,
      ),
    );
  }

  Widget _buildBanner() {
    return BlocBuilder<PromotionsCubit, PromotionsState>(
      builder: (context, state) {
        if (state is PromotionsLoading) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is PromotionsLoaded && state.offers.isNotEmpty) {
          return CarouselSlider.builder(
            itemCount: state.offers.length,
            itemBuilder: (context, index, _) {
              final offer = state.offers[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PromotionDetailsPage(promotion: offer)),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(offer.imageUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 160,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.85,
            ),
          );
        }
        // Fallback or empty state
        return const SizedBox();
      },
    );
  }

  Widget _buildCategories() {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        if (state is CatalogLoading) return const Center(child: CircularProgressIndicator());
        if (state is CatalogLoaded) {
          return SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: state.categories.length,
              itemBuilder: (context, index) => _buildCategoryChip(state.categories[index]),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildCategoryChip(CategoryModel category) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ActionChip(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListProductScreen(categoryId: category.id.toString(), categoryName: category.name),
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Colors.black87),
        ),
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(ImageUrlUtils.getFullUrl(category.image)),
        ),
        label: Text(category.name, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildListings() {
    return BlocBuilder<ListingsCubit, ListingsState>(
      builder: (context, state) {
        if (state is ListingsLoading) return const Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()));
        if (state is ListingsLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: state.listings.length,
            itemBuilder: (context, index) => PremiumListingCard(listing: state.listings[index]),
          );
        }
        return const SizedBox();
      },
    );
  }
}
