import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import '../../orders/data/models/order_model.dart';
import '../widget/card_product.dart';
import '../widget/inforow.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        leading: const ArrowBack(),
        title: Text("order_details".tr(), style: AppTextStyles.heading),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...order.items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CardProduct(item: item),
            )),
            const SizedBox(height: 20),
            Text("order_summary".tr(), style: AppTextStyles.heading),
            const SizedBox(height: 10),
            Inforow(title: "order_id".tr(), value: "#${order.orderNumber}"),
            Inforow(title: "total_amount".tr(), value: "${order.totalAmount} EGP"),
            Inforow(title: "status".tr(), value: order.status),
            Inforow(title: "date".tr(), value: DateFormat('dd MMM, yyyy').format(order.createdAt)),
            const SizedBox(height: 20),
            Divider(color: AppColors.border),
            const SizedBox(height: 10),
            Text("order_tracking".tr(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            _statusItem("order_placed".tr(), DateFormat('dd MMM, hh:mm a').format(order.createdAt), true),
            _statusItem("processing".tr(), "done", order.status != 'PENDING'),
            _statusItem("shipped".tr(), "expected", order.status == 'COMPLETED'),
            _statusItem("delivery".tr(), "expected", order.status == 'COMPLETED'),
          ],
        ),
      ),
    );
  }

  Widget _statusItem(String title, String date, bool done) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
