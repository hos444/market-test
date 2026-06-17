import 'package:flutter/material.dart';

class CardListProduct extends StatelessWidget {
  final String name;
  final String image;
  const CardListProduct({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 20),
      child: Card(
        color: const Color(0xFFD9D9D9),
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 124,
                width: 121,
                child: Image.asset(image),
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
