import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardHOme3 extends StatelessWidget {
  const CardHOme3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 107,
      width: 113,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                'assets/fruits/strobary.png',
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'strobary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icons/location.svg'),
                      SizedBox(width: 2),
                      Text(
                        'vally farms',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
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
