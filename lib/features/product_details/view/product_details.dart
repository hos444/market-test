import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/snackbar_utils.dart';
import '../../listings/data/models/listing_model.dart';
import '../../favorite/presentation/bloc/favorite_cubit.dart';
import '../../cart/widgets/cart_controller.dart';
import '../../listings/presentation/bloc/listings_cubit.dart';
import 'package:finall_app/injection_container.dart' as di;

class Productdetails extends StatelessWidget {
  final ListingModel listing;
  const Productdetails({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = di.sl<ListingsCubit>();
        if (listing.crop?.categoryId != null) {
          cubit.fetchPublicListings(filters: {'category_id': listing.crop!.categoryId});
        }
        return cubit;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(context),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleSection(),
                    const SizedBox(height: 20),
                    _buildInfoChips(),
                    const SizedBox(height: 25),
                    _buildSectionTitle("description".tr()),
                    const SizedBox(height: 8),
                    Text(
                      listing.description ?? "no_description".tr(),
                      style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
                    ),
                    const SizedBox(height: 25),
                    if (listing.storageInformation != null) ...[
                      _buildSectionTitle("storage_info".tr()),
                      const SizedBox(height: 8),
                      _buildInfoRow(Icons.storage, listing.storageInformation!),
                      const SizedBox(height: 15),
                    ],
                    _buildSectionTitle("seller_info".tr()),
                    const SizedBox(height: 10),
                    _buildSellerCard(),
                    const SizedBox(height: 25),
                    _buildRelatedProducts(),
                    const SizedBox(height: 100), // Space for bottom bar
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      backgroundColor: Colors.green,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white70,
          child: ArrowBack(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white70,
            child: BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                bool isFavorite = false;
                if (state is FavoritesLoaded) {
                  isFavorite = state.listings.any((l) => l.id == listing.id);
                }
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.green,
                  ),
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite(listing.id);
                  },
                );
              },
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'product_${listing.id}',
          child: Image.network(
            ImageUrlUtils.getFullUrl(listing.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                listing.title,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                listing.status.tr(),
                style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "${listing.price} EGP / ${listing.unit}",
          style: const TextStyle(fontSize: 22, color: Colors.green, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildInfoChips() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        if (listing.qualityGrade != null)
          _buildChip(Icons.grade, "${"quality".tr()}: ${listing.qualityGrade}"),
        if (listing.harvestDate != null)
          _buildChip(Icons.calendar_today, "${"harvest_date".tr()}: ${listing.harvestDate}"),
        if (listing.minOrderQuantity != null && listing.minOrderQuantity! > 0)
          _buildChip(Icons.shopping_basket, "${"min_order".tr()}: ${listing.minOrderQuantity} ${listing.unit}"),
      ],
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.green),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.black54))),
      ],
    );
  }

  Widget _buildSellerCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.user?.name ?? "unknown_seller".tr(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(listing.user?.role?.tr() ?? "seller".tr(), style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              ],
            ),
          ),
          IconButton(
            onPressed: () {}, // Future: Chat or Profile
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedProducts() {
    return BlocBuilder<ListingsCubit, ListingsState>(
      builder: (context, state) {
        if (state is ListingsLoading) return const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator()));
        if (state is ListingsLoaded) {
          final relatedListings = state.listings.where((l) => l.id != listing.id).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("related_products".tr()),
              const SizedBox(height: 15),
              if (relatedListings.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "no_related_products".tr(),
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: relatedListings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        margin: EdgeInsets.only(
                          left: context.locale.languageCode == 'ar' ? 15 : 0,
                          right: context.locale.languageCode == 'en' ? 15 : 0,
                        ),
                        child: PremiumListingCard(listing: relatedListings[index]),
                      );
                    },
                  ),
                ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: Text("make_offer".tr(), style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              onPressed: () {
                context.read<CartController>().addToCart(listing);
                SnackBarUtils.showSuccess(
                  context,
                  "added_to_cart_success".tr(args: [listing.title]),
                );
              },
              child: Text("add_to_cart".tr(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
