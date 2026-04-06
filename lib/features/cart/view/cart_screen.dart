import 'package:finall_app/features/cart/widgets/cart_controller.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // ليست المنتجات (تجريبية)
  List<FreashModel> items = [];

  // ليست الكميات لكل منتج
  List<int> quantities = [];

  // بنهيأ الكميات = 1 لكل منتج
  @override
  void initState() {
    super.initState();
    quantities = List.generate(items.length, (index) => 1);
  }

  // دالة بتحسب التوتال بناء على الكميات
  double calculateTotal(CartController cart) {
    double total = 0;
    for (var item in cart.cartItems) {
      double price = double.tryParse(item.product.price) ?? 0;
      total += price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainScreen(initialPage: 0), // 2 = Cart
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text("My Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      // قائمة المنتجات
      body: Container(
        height: 600,
        width: double.infinity,
        // decoration: BoxDecoration(color: Colors.amber),
        child: Consumer<CartController>(
          builder: (context, cart, child) {
            return ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final item = cart.cartItems[index];
                return Cartcard(
                  nameCart: item.product.name,
                  imageCart: item.product.image,
                  priceCart: "${item.product.price} EGP",
                  quantity: item.quantity,
                  onIncrease: () => cart.increaseQuantity(index),
                  onDecrease: () => cart.decreaseQuantity(index),
                  onDelete: () => cart.removeItem(index),
                );
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
              child: Consumer<CartController>(
                builder: (context, cart, child) {
                  return Text(
                    "Total: \$${calculateTotal(cart)}",
                    style: TextStyle(fontSize: 22),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 29.0, right: 29.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
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
