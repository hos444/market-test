import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../listings/data/models/listing_model.dart';
import '../../product_details/view/product_details.dart';
import '../presentation/bloc/favorite_cubit.dart';
import '../../../../core/utils/image_url_utils.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../cart/widgets/cart_controller.dart';

class CardFavourite extends StatelessWidget {
  final ListingModel listing;

  const CardFavourite({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Productdetails(listing: listing),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      ImageUrlUtils.getFullUrl(listing.image),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 80),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => context.read<FavoriteCubit>().toggleFavorite(listing.id),
                      child: const Icon(Icons.favorite, color: Colors.green, size: 24),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              listing.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(5, (index) => Icon(Icons.star, color: index < 4 ? Colors.green : Colors.grey.shade300, size: 14)),
                const SizedBox(width: 4),
                const Text("4.5/5", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              "${listing.price} EGP",
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.read<CartController>().addToCart(listing);
                  SnackBarUtils.showSuccess(
                    context,
                    "added_to_cart_success".tr(args: [listing.title]),
                  );
                },
                child: Text(
                  "add_to_cart".tr(),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
