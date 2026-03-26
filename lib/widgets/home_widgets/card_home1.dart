import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //image prodect
                Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  width: 95,
                  height: 112,
                  child: Image(image: AssetImage(imagecard), fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // name prodect
                      Text(
                        namecard,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      //price
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/location.svg'),
                          SizedBox(width: 6),
                          Text(
                            'vally farms',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      //price
                      Text(
                        pricecard,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      //price
                      Text(
                        'timer',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
