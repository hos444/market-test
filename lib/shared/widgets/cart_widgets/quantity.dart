// ده ويدجت مسؤول عن شكل العداد فقط (UI)
// مفيهوش أي state داخلي، بياخد القيم من برّه
// وبيبعت الأحداث (زيادة/نقصان) للصفحة الأب

import 'package:flutter/material.dart';

class QuantityCounter extends StatelessWidget {
  // الكمية الحالية اللي جاية من الأب
  final int quantity;

  // الفنكشن اللي هتشتغل لما المستخدم يدوس +
  final VoidCallback onIncrease;

  // الفنكشن اللي هتشتغل لما المستخدم يدوس -
  final VoidCallback onDecrease;

  const QuantityCounter({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),

      // نفس تصميمك بالظبط
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زرار النقصان
          InkWell(
            onTap: onDecrease,
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(Icons.remove, size: 18),
            ),
          ),

          // عرض الكمية
          Text(
            "$quantity",
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 8, 93, 21),
            ),
          ),

          // زرار الزيادة
          InkWell(
            onTap: onIncrease,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.add, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
