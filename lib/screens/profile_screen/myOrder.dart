import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finall_app/shared/widgets/arrow.dart';
import 'package:finall_app/shared/widgets/product_info/ordeartaps.dart';
import 'package:finall_app/shared/widgets/product_info/prodaict_card.dart';
import 'package:flutter/material.dart';

class Myorder extends StatelessWidget {
  const Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        title: const Text(
          "My Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),

        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: OrderStatusTabs(),
            ),
            OrderCard(),
            OrderCard(),
            OrderCard(),
          ],
        ),
      ),
    );
  }
}
