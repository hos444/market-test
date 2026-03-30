import 'package:flutter/material.dart';

class Myorder extends StatelessWidget {
  const Myorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: Center(child: Text('This is the My Orders screen.')),
    );
  }
}
