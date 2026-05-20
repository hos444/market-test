import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../bloc/listings_cubit.dart';
import '../../data/models/listing_model.dart';

class FarmerDashboardPage extends StatefulWidget {
  const FarmerDashboardPage({super.key});

  @override
  State<FarmerDashboardPage> createState() => _FarmerDashboardPageState();
}

class _FarmerDashboardPageState extends State<FarmerDashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListingsCubit>().fetchFarmerListings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Farmer_J.dashboard".tr(),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xff1B5E3C)),
            onPressed: () => context.read<ListingsCubit>().fetchFarmerListings(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<ListingsCubit>().fetchFarmerListings(),
        color: const Color(0xff1B5E3C),
        child: BlocBuilder<ListingsCubit, ListingsState>(
          builder: (context, state) {
            if (state is ListingsLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xff1B5E3C)));
            }

            if (state is ListingsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline_rounded, size: 64, color: Colors.red.shade300),
                    const SizedBox(height: 16),
                    Text(state.message, style: TextStyle(color: Colors.grey.shade600)),
                    TextButton(
                      onPressed: () => context.read<ListingsCubit>().fetchFarmerListings(),
                      child: Text("retry".tr()),
                    ),
                  ],
                ),
              );
            }

            if (state is ListingsLoaded) {
              final listings = state.listings;
              
              if (listings.isEmpty) {
                return _buildEmptyState();
              }

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryCards(listings),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Farmer_J.listings".tr(),
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${listings.length} ${"items".tr()}",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listings.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => _buildListingCard(listings[index]),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddListingPage()),
        ).then((_) => context.read<ListingsCubit>().fetchFarmerListings()),
        backgroundColor: const Color(0xff1B5E3C),
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: Text("Farmer_J.add_listing".tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xff1B5E3C).withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.agriculture_rounded, size: 80, color: const Color(0xff1B5E3C).withOpacity(0.5)),
          ),
          const SizedBox(height: 24),
          Text(
            "no_listings_yet".tr(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "start_adding_crops".tr(),
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(List<ListingModel> listings) {
    return Row(
      children: [
        _buildStatCard(
          title: "total_crops".tr(),
          value: listings.length.toString(),
          icon: Icons.inventory_2_outlined,
          color: const Color(0xff1B5E3C),
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          title: "active_status".tr(),
          value: listings.where((l) => l.status == 'AVAILABLE' || l.status == 'pending').length.toString(),
          icon: Icons.check_circle_outline_rounded,
          color: Colors.blue.shade700,
        ),
      ],
    );
  }

  Widget _buildStatCard({required String title, required String value, required IconData icon, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 5)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildListingCard(ListingModel listing) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              ImageUrlUtils.getFullUrl(listing.image),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80,
                height: 80,
                color: Colors.grey.shade100,
                child: const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "${listing.price} EGP / ${listing.unit}",
                  style: const TextStyle(color: Color(0xff1B5E3C), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                _buildStatusChip(listing.status),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String label;
    
    switch (status.toUpperCase()) {
      case 'AVAILABLE':
        color = Colors.green;
        label = "available".tr();
        break;
      case 'SOLD':
        color = Colors.grey;
        label = "sold".tr();
        break;
      case 'PENDING':
        color = Colors.orange;
        label = "pending".tr();
        break;
      default:
        color = Colors.blue;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }
}
