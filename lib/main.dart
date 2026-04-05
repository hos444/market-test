import 'package:finall_app/features/cart/widgets/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // هنا لو عاوز تبدل مع اللوجن بحيث تفتح عليها ع طووووول
      //  ====================Login Page=========================
      home: MainScreen(
        initialPage: 0, // 0 = Home
      ),
    );
  }
}
