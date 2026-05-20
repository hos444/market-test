import 'package:finall_app/features/cart/widgets/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/snackbar_utils.dart';
import '../../listings/data/models/listing_model.dart';

class Cardhome2 extends StatelessWidget {
  final ListingModel listing;
  const Cardhome2({
    super.key,
    required this.listing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  width: 220,
                  height: 170,
                  child: Image.network(ImageUrlUtils.getFullUrl(listing.image), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listing.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text('Vally Farms', style: TextStyle(color: Colors.green)),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.orange, size: 16),
                          const Text('3.9 /', style: TextStyle(fontSize: 16)),
                          Text("reviews_count".tr(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text("1 ${listing.unit}, ${listing.price} EGP", style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            bottom: 12,
            end: 20,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {
                  context.read<CartController>().addToCart(listing);
                  SnackBarUtils.showSuccess(
                    context,
                    "added_to_cart_success".tr(args: [listing.title]),
                  );
                },
                icon: const Icon(Icons.shopping_cart, size: 16, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
