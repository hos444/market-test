import 'package:finall_app/model.dart';
import 'package:finall_app/shared/export_packeg.dart';
import 'package:finall_app/widgets/card_cart.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProdactModelCart> carditemCart = [
    ProdactModelCart(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '\$3.55',
    ),
    ProdactModelCart(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orang.png',
      priceCart: '\$3.55',
    ),
    ProdactModelCart(
      nameCart: 'Limon',
      imageCart: 'assets/fruits/limon.png',
      priceCart: '\$3.55',
    ),
    ProdactModelCart(
      nameCart: 'pepper',
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '\$3.55',
    ),
    ProdactModelCart(
      nameCart: 'Biscuit',
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '\$3.55',
    ),
    ProdactModelCart(
      nameCart: 'purex',
      imageCart: 'assets/fruits/purex.png',
      priceCart: '\$3.55',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.receipt_long),
                SizedBox(width: 4),
                Text('Orders', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),

      // body with prodect
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 187),
        itemCount: carditemCart.length,
        itemBuilder: (context, index) {
          final item = carditemCart[index];
          return Cartcard(
            nameCart: item.nameCart,
            imageCart: item.imageCart,
            priceCart: item.priceCart,
          );
        },
      ),

      // bottom sheet
      bottomSheet: Container(
        height: 177,
        width: 339,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 3, color: Color(0xFF0CA201)),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 35, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'item : ${carditemCart.length}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'item cost : 445',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 15),
            //botton check out
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff74B625),
                  foregroundColor: const Color(0xffFFFFFF),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: const Text("Check Out"),
              ),
            ),
          ],
        ),
      ),

      // الـ bottom navigation bar
      bottomNavigationBar: HomeLayout(),
    );
  }
}
