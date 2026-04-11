import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrderStatusTabs extends StatefulWidget {
  const OrderStatusTabs({super.key});

  @override
  State<OrderStatusTabs> createState() => _OrderStatusTabsState();
}

class _OrderStatusTabsState extends State<OrderStatusTabs> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "orderStatus.pending".tr(),
    "orderStatus.completed".tr(),
    "orderStatus.canceled".tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.green),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF0B5D4B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}
