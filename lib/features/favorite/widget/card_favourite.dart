import 'package:flutter/material.dart';

import '../../../core/utils/export_packeg.dart';

class CardFavourite extends StatelessWidget {
  // final String farmName;
  final String nameFavourite, imageFavourite, priceFavourite;
  const CardFavourite({
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
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    imageFavourite,
                    height: 80,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const Positioned(
                  right: 0,
                  child: Icon(Icons.favorite, color: Colors.green, size: 22),
                ),
              ],
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainScreen(initialPage: 2), // 2 = Cart
                    ),
                  );
                },
                child: Text(
                  "إضافة إلى السلة",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
