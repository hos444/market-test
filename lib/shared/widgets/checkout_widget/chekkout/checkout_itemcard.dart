import 'package:flutter/material.dart';

class CheckoutItemCCard extends StatelessWidget {
  const CheckoutItemCCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/fruits/limon.png",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// info
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Lemon",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Text(
                      "\$29.99 / 1 pck",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  "Fruit",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 4),
              ],
            ),
          ),

          /// quantity buttons
        ],
      ),
    );
  }
}
