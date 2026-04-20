import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        leading: ArrowBack(),

        title: Text("order_details".tr(), style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardProduct(price: "\$ 100"),
            const SizedBox(height: 16),

            Text("order_details".tr(), style: AppTextStyles.heading),
            const SizedBox(height: 10),

            Inforow(title: "expected_delivery_date".tr(), value: "02 Apr 2026"),
            Inforow(title: "tracking_id".tr(), value: "TRK458598589"),
            Inforow(title: "address".tr(), value: "storage1"),
            Inforow(title: "payment_method".tr(), value: "Visa"),
            Inforow(title: "receiver_name".tr(), value: "mohammed"),
            Inforow(
              title: "receiver_phone_number".tr(),
              value: "01121234254112",
            ),

            const SizedBox(height: 20),
            Divider(color: AppColors.border),

            const SizedBox(height: 10),
            Text("Order status", style: AppTextStyles.heading),

            const SizedBox(height: 16),

            _statusItem("order_placed".tr(), "23 Mar 2026, 05:30 PM", true),
            _statusItem("warehouse".tr(), "23 Mar 2026, 05:30 PM", true),
            _statusItem("shipped".tr(), "Expected 02 Apr 2026", false),
            _statusItem("delivery".tr(), "Expected 02 Apr 2026", false),
          ],
        ),
      ),
    );
  }

  // 🚚 Status Item
  Widget _statusItem(String title, String date, bool done) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          done ? Icons.check_circle : Icons.radio_button_unchecked,
          color: done ? AppColors.primary : Colors.grey,
        ),
        const SizedBox(width: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.body),
            const SizedBox(height: 4),
            Text(date, style: AppTextStyles.small),
          ],
        ),
      ],
    );
  }
}
