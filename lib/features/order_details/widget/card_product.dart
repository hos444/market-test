import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
class CardProduct extends StatelessWidget {
  final String price;
  const CardProduct({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/fruits/banana.png', // غيرها حسب عندك
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
                "Banana".tr(),
                style: AppTextStyles.heading.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 4),
              Text("Order id: #12345", style: AppTextStyles.small),
              const SizedBox(height: 8),
              Text("weight : 50kg", style: AppTextStyles.body),
            ],
          ),
        ),

        Text(
          price,
          style: AppTextStyles.heading.copyWith(color: Colors.orange),
        ),
      ],
    );
  }
}