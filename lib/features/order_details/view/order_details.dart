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

        title: Text("Order details", style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardProduct(),
            const SizedBox(height: 16),

            Text("Order Details", style: AppTextStyles.heading),
            const SizedBox(height: 10),

            Inforow(title: "Expected delivery date:", value: "02 Apr 2026"),
            Inforow(title: "Tracking ID:", value: "TRK458598589"),
            Inforow(title: "Address:", value: "storage1"),
            Inforow(title: "Payment method:", value: "Visa"),
            Inforow(title: "Receiver Name:", value: "mohammed"),
            Inforow(title: "Receiver Phone Number:", value: "01121234254112"),

            const SizedBox(height: 20),
            Divider(color: AppColors.border),

            const SizedBox(height: 10),
            Text("Order status", style: AppTextStyles.heading),

            const SizedBox(height: 16),

            _statusItem("Order placed", "23 Mar 2026, 05:30 PM", true),
            _statusItem("Warehouse", "23 Mar 2026, 05:30 PM", true),
            _statusItem("Shipped", "Expected 02 Apr 2026", false),
            _statusItem("Delivery", "Expected 02 Apr 2026", false),
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
