import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 361,
        height: 144,

        child: Card(
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image prodect
                    Container(
                      width: 124,
                      height: 121,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(imageFavourite, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name prodect
                        Text(
                          nameFavourite,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 20),
                        // row of farm name
                        Row(
                          children: [
                            Text('Farm Name :', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        //price
                        Row(
                          children: [
                            Text('min weight: 50kg/ '),
                            Text(
                              '\$ $priceFavourite',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: const Color.fromARGB(255, 255, 161, 19),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // زرار
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "add to cart",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 20),
                            // لينك
                            Text(
                              "More details >",
                              style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
