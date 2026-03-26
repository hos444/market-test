import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Cardhome2 extends StatelessWidget {
  const Cardhome2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 179,
      width: 122,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/fruits/strobary.png', height: 94, width: 109),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Srobary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(height: 5),
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
                  SizedBox(height: 5),
                  Text(
                    '\$ 9.70',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
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
