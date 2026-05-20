import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../../orders/data/models/order_model.dart';

class CardProduct extends StatelessWidget {
  final OrderItemModel item;
  const CardProduct({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            ImageUrlUtils.getFullUrl(item.listing?.image),
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.listing?.title ?? "Product",
                style: AppTextStyles.heading.copyWith(color: AppColors.primary, fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text("Quantity: ${item.quantity}", style: AppTextStyles.body),
            ],
          ),
        ),
        Text(
          "${item.price} EGP",
          style: AppTextStyles.heading.copyWith(color: Colors.orange, fontSize: 16),
        ),
      ],
    );
  }
}