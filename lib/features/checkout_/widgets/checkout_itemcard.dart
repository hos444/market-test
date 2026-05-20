import 'package:flutter/material.dart';
import 'package:finall_app/features/cart/models/cart_item_modle.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';

class CheckoutItemCCard extends StatelessWidget {
  final CartItemModel item;
  const CheckoutItemCCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Row(
        children: [
          /// image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              ImageUrlUtils.getFullUrl(item.product.image),
              height: 60,
              width: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 30, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          /// info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.product.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "${item.product.price} EGP",
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "${item.quantity} x ${item.product.unit}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
