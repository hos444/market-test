import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/cart/widgets/cart_controller.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final VoidCallback onPlaceOrder;
  const CheckoutBottomSheet({super.key, required this.onPlaceOrder});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>();
    final subtotal = cart.totalAmount;
    final shipping = subtotal > 0 ? 20.0 : 0.0;
    final tax = subtotal > 0 ? 5.0 : 0.0;
    final total = subtotal + shipping + tax;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "orderDetails.Payment Summary".tr(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _PriceRow("item_total_ar".tr(), "${subtotal.toStringAsFixed(2)} EGP"),
                const SizedBox(height: 10),
                _PriceRow("shipping_ar".tr(), "${shipping.toStringAsFixed(2)} EGP"),
                const SizedBox(height: 10),
                _PriceRow("tax_ar".tr(), "${tax.toStringAsFixed(2)} EGP"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Color(0xFFF1F5F9), height: 1),
                ),
                Row(
                  children: [
                    Text(
                      "cart_total".tr(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const Spacer(),
                    Text(
                      "${total.toStringAsFixed(2)} EGP",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF2E7D32).withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPlaceOrder,
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock_outline, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "secure_checkout".tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String title;
  final String price;

  const _PriceRow(this.title, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const Spacer(),
        Text(
          price,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    );
  }
}
