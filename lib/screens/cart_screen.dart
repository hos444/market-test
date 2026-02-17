import 'package:finall_app/model.dart';
import 'package:finall_app/widgets/card_prodect.dart';
import 'package:finall_app/widgets/card_prodect_cart.dart';
import 'package:flutter/material.dart';

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
      imageCart: 'assets/fruits/orange.png',
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
      //app bar is ready
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
      body: Column(
        children: [
          SizedBox(height: 10),
          //list of prodect
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              height: 434,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(carditemCart.length, (index) {
                    final item = carditemCart[index];
                    return Cartcard(
                      nameCart: item.nameCart,
                      imageCart: item.imageCart,
                      priceCart: item.priceCart,
                    );
                  }),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          //bottom sheet for check out
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Container(
              height: 177,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 3, color: const Color(0xFF0CA201)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
