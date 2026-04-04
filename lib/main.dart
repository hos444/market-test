
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: MainScreen(
        initialPage: 0, // 0 = Home
      ),
    );
  }
}
