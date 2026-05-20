import 'package:finall_app/features/cart/widgets/cart_controller.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/dialog_utils.dart';
import 'package:finall_app/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20),
        ),
        title: Text("cart".tr(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<CartController>(
        builder: (context, cart, child) {
          if (cart.cartItems.isEmpty) {
            return _buildEmptyCart();
          }
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: cart.cartItems.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final item = cart.cartItems[index];
              return Cartcard(
                nameCart: item.product.title,
                imageCart: item.product.image ?? '',
                priceCart: "${item.product.price} EGP",
                quantity: item.quantity,
                onIncrease: () => cart.increaseQuantity(index),
                onDecrease: () => cart.decreaseQuantity(index),
                onDelete: () async {
                  final confirmed = await DialogUtils.showConfirmationDialog(
                    context: context,
                    title: "remove_item_title".tr(),
                    message: "remove_item_message".tr(args: [item.product.title]),
                    confirmColor: Colors.orange, // Warning color
                  );

                  if (confirmed == true) {
                    final title = item.product.title;
                    cart.removeItem(index);
                    if (context.mounted) {
                      SnackBarUtils.showError(
                        context,
                        "item_removed_success".tr(args: [title]),
                      );
                    }
                  }
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CartController>(
        builder: (context, cart, child) {
          if (cart.cartItems.isEmpty) return const SizedBox();
          return Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("total".tr(), style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                    Text(
                      "${cart.totalAmount} EGP",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xff1B5E3C)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1B5E3C),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Checkout())),
                  child: Text(
                    "checkout".tr(),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_basket_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 24),
          Text(
            "empty_cart".tr(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen(initialPage: 0))),
            child: Text("shop_now".tr(), style: const TextStyle(color: Color(0xff1B5E3C))),
          ),
        ],
      ),
    );
  }
}

