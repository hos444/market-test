import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cart/widgets/cart_controller.dart';
import 'checkout_itemcard.dart';

class CheckoutItemsSection extends StatefulWidget {
  const CheckoutItemsSection({super.key});

  @override
  State<CheckoutItemsSection> createState() => _CheckoutItemsSectionState();
}

class _CheckoutItemsSectionState extends State<CheckoutItemsSection>
    with SingleTickerProviderStateMixin {
  bool isExpanded = true; // Default to expanded to show items

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>();

    return Column(
      children: [
        /// ===== HEADER =====
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xffE6F4F1),
                  child: Icon(Icons.shopping_bag_outlined, color: Colors.green),
                ),
                const SizedBox(width: 12),
                /// title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "order_summary".tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "${cart.cartItems.length} ${"items".tr()}",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                /// arrow animation
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
        ),

        /// ===== EXPAND AREA =====
        AnimatedCrossFade(
          firstChild: const SizedBox(),
          secondChild: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: cart.cartItems.map((item) => CheckoutItemCCard(item: item)).toList(),
            ),
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }
}
