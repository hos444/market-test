import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardProdect extends StatelessWidget {
  final String name, image, price, rate, ratecount;
  const CardProdect({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rate,
    required this.ratecount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 160,
                  height: 147,
                  child: Image.asset(image),
                ),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/star.svg'),
                    SizedBox(width: 3),
                    Text(rate, style: TextStyle(fontWeight: FontWeight.normal)),
                    SizedBox(width: 5),
                    Text(
                      ratecount,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '\$ $price',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
