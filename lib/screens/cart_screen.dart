import 'package:finall_app/model.dart';
import 'package:finall_app/screens/checkout_/checkout_screen.dart';
import 'package:finall_app/shared/widgets/arrow.dart';
import 'package:finall_app/shared/widgets/bottom_nav_bar.dart';
import 'package:finall_app/shared/widgets/cart_widgets/card_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // ليست المنتجات (تجريبية)
  List<FreashModel> items = [
    FreashModel(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '500.0',
    ),
    FreashModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orang.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'Limon',
      imageCart: 'assets/fruits/limon.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'pepper',
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'Biscuit',
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'purex',
      imageCart: 'assets/fruits/purex.png',
      priceCart: '100.0',
    ),
  ];

  // ليست الكميات لكل منتج
  List<int> quantities = [];

  int currentIndex = 1;

  // بنهيأ الكميات = 1 لكل منتج
  @override
  void initState() {
    super.initState();
    quantities = List.generate(items.length, (index) => 1);
  }

  // دالة بتحسب التوتال بناء على الكميات
  double calculateTotal() {
    double total = 0;

    for (int i = 0; i < items.length; i++) {
      double price = double.parse(
        items[i].priceCart.replaceAll('\$', '').trim(),
      );

      total += price * quantities[i];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        title: Text("My Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      // قائمة المنتجات
      body: Container(
        height: 600,
        width: double.infinity,
        // decoration: BoxDecoration(color: Colors.amber),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Cartcard(
              nameCart: items[index].nameCart,
              imageCart: items[index].imageCart,
              priceCart: items[index].priceCart,
              quantity: quantities[index],

              onIncrease: () {
                setState(() {
                  quantities[index]++;
                });
              },

              onDecrease: () {
                if (quantities[index] > 1) {
                  setState(() {
                    quantities[index]--;
                  });
                }
              },
            );
          },
        ),
      ),

      // البوتوم شيت (التوتال)
      bottomSheet: Container(
        height: 148,
        width: 412,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Total:                                 \$ ${calculateTotal()}",
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, right: 29.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  foregroundColor: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.black45,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Checkout()),
                  );
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
