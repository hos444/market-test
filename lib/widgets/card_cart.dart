import 'package:flutter/material.dart';

class Cartcard extends StatelessWidget {
  final String nameCart, imageCart, priceCart;
  const Cartcard({
    super.key,
    required this.nameCart,
    required this.imageCart,
    required this.priceCart,
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
                  child: Image.asset(imageCart),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    // name prodect
                    Text(
                      nameCart,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    //price
                    Text(
                      '\$ $priceCart',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                // total text need upgriad to kickabil
                Padding(
                  padding: const EdgeInsets.only(top: 27.0),
                  child: Text('total : 30'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
