import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/snackbar_utils.dart';
import 'package:finall_app/features/listings/data/models/listing_model.dart';
import 'package:finall_app/features/product_details/view/product_details.dart';
import 'package:finall_app/features/favorite/presentation/bloc/favorite_cubit.dart';
import 'package:finall_app/features/cart/widgets/cart_controller.dart';

class PremiumListingCard extends StatelessWidget {
  final ListingModel listing;

  const PremiumListingCard({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Productdetails(listing: listing))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Stack(
                  children: [
                    Image.network(ImageUrlUtils.getFullUrl(listing.image), fit: BoxFit.cover, width: double.infinity, errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          bool isFavorite = false;
                          if (state is FavoritesLoaded) {
                            isFavorite = state.listings.any((l) => l.id == listing.id);
                          }
                          return GestureDetector(
                            onTap: () => context.read<FavoriteCubit>().toggleFavorite(listing.id),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white.withOpacity(0.8),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                                size: 18,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listing.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 4),
                      Text("4.5/5", style: TextStyle(color: Colors.grey.shade600, fontSize: 10)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("${listing.unit}", style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("${listing.price} EGP", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      GestureDetector(
                        onTap: () {
                          context.read<CartController>().addToCart(listing);
                          SnackBarUtils.showSuccess(
                            context,
                            "added_to_cart_success".tr(args: [listing.title]),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.add_shopping_cart_rounded, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
