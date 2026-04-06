// ignore: file_names
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class Myorder extends StatelessWidget {
  const Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainScreen(initialPage: 0), // 2 = Cart
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
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
          ],
        ),
      ),
    );
  }
}
