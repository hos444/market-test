import 'package:flutter/material.dart';

class CartOffers extends StatelessWidget {
  // final String farmName;
  final String nameFavourite, imageFavourite, priceFavourite;
  const CartOffers({
    super.key,
    required this.nameFavourite,
    required this.imageFavourite,
    required this.priceFavourite,
    // required this.farmName,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                imageFavourite,
                height: 80,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              nameFavourite,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "4.5/5",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.star, size: 16, color: Colors.green),
                Icon(Icons.star, size: 16, color: Colors.green),
                Icon(Icons.star, size: 16, color: Colors.green),
                Icon(Icons.star, size: 16, color: Colors.green),
                Icon(Icons.star_half, size: 16, color: Colors.green),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              priceFavourite,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
