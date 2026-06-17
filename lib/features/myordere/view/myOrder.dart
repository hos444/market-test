// ignore: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class Myorder extends StatelessWidget {
  const Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        title: Text(
          "myOrders.title".tr(),
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
