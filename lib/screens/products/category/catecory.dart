import 'package:finall_app/screens/products/list_screen.dart';
import 'package:finall_app/shared/widgets/arrow.dart';
import 'package:finall_app/shared/widgets/product_info/prodaict_card.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/shared/widgets/product_info/ordeartaps.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        title: const Text(
          "Category",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      ),
      body: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
