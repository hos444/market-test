import 'package:flutter/material.dart';

class CardFavourite extends StatelessWidget {
  final String nameFavourite, imageFavourite, priceFavourite;
  const CardFavourite({
    super.key,
    required this.nameFavourite,
    required this.imageFavourite,
    required this.priceFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                //image prodect
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 67,
                  height: 67,
                  child: Image.asset(imageFavourite),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    // name prodect
                    Text(
                      nameFavourite,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    //price
                    Text(
                      '\$ $priceFavourite',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
