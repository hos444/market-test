import 'package:finall_app/features/order_details/model/card_model.dart';
import 'package:finall_app/features/order_details/widget/card_order_details.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final List<PrescriptionModel> prescriptions = [
    PrescriptionModel(name: "Hossam", id: "123456", date: "12/3/2026"),
    PrescriptionModel(name: "Ali", id: "789456", date: "15/3/2026"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Order Details')),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              prescriptions.length,
              (index) => PrescriptionCard(model: prescriptions[index]),
            ),
          ),
        ),
      ),
    );
  }
}
