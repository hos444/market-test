import 'package:flutter/material.dart';


class Cardhome2 extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  const Cardhome2({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            color: const Color.fromRGBO(255, 255, 255, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  width: 220,
                  height: 170,
                  child: Image(image: AssetImage(image), fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name prodect
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 37, 125, 38),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            'vally farms',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text(
                                '3.9 /',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '50 reviews',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '1kg, price',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      //price
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),

                      //price
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 20,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 242, 212),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 16,
                  color: const Color.fromARGB(255, 82, 180, 85),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 70,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 217, 217),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border, size: 16, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
