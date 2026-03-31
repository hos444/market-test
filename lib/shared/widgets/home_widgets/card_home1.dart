import 'package:finall_app/screens/products/prodict_screen.dart';
import 'package:finall_app/screens/products/list_screen.dart';
import 'package:flutter/material.dart';

class CardHome1 extends StatelessWidget {
  final String namecard;
  final String pricecard;
  final String imagecard;
  const CardHome1({
    super.key,
    required this.namecard,
    required this.imagecard,
    required this.pricecard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              width: 220,
              height: 190,
              child: Image(image: AssetImage(imagecard), fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(
                        '3.9 /',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '50 reviews',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                  // name prodect
                  Text(
                    namecard,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: const Color.fromARGB(255, 37, 125, 38),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          39,
                          167,
                          103,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 4,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdetails(),
                          ),
                        );
                      },

                      child: Text(
                        "Browse products",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
