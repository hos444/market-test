import 'package:finall_app/features/cart/models/cart_item_modle.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/features/cart/models/models.dart';

class CartController extends ChangeNotifier {
  /// المنتجات داخل الكارت (منتج + كمية)
  List<CartItemModel> cartItems = [];

  /// إضافة منتج للكارت
  void addToCart(ProductModel product) {
    final index = cartItems.indexWhere(
      (item) => item.product.name == product.name,
    );

    // لو المنتج موجود → زود الكمية
    if (index != -1) {
      cartItems[index].quantity++;
    }
    // لو جديد → ضيفه
    else {
      cartItems.add(CartItemModel(product: product));
    }

    notifyListeners();
  }

  /// زيادة الكمية
  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  /// تقليل الكمية
  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      notifyListeners();
    }
  }

  /// حذف منتج
  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }
}
