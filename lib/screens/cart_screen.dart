import 'package:finall_app/model.dart';
import 'package:finall_app/screens/home.dart';
import 'package:finall_app/widgets/card_prodect_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _currentIndex = 0;
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
          //list of prodect
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              height: 459,
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
          Spacer(),
          //bottom sheet for check out
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10),
            child: Container(
              width: double.infinity,
              height: 177,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 3, color: const Color(0xFF0CA201)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'item :   4',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'item cost : 445 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //bottombaar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
