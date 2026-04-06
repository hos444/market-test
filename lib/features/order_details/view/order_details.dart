import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: ArrowBack(),
        centerTitle: true,
        title: Text("Order details", style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productCard(),
            const SizedBox(height: 16),

            Text("Order Details", style: AppTextStyles.heading),
            const SizedBox(height: 10),

            _infoRow("Expected delivery date:", "02 Apr 2026"),
            _infoRow("Tracking ID:", "TRK458598589"),
            _infoRow("Address:", "storage1"),
            _infoRow("Payment method:", "Visa"),
            _infoRow("Receiver Name:", "mohammed"),
            _infoRow("Receiver Phone Number:", "01121234254112"),

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

  // 🟢 Product Card
  Widget _productCard() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/fruits/strobary.png', // غيرها حسب عندك
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
                "Strawberry",
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
          "\$ 9.70",
          style: AppTextStyles.heading.copyWith(color: Colors.orange),
        ),
      ],
    );
  }

  // 📄 Info Row
  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          text: "$title ",
          style: AppTextStyles.body.copyWith(color: Colors.black),
          children: [TextSpan(text: value, style: AppTextStyles.body)],
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
