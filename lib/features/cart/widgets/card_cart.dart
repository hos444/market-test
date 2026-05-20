// ده الكارت بتاع المنتج
// وظيفته يعرض البيانات (صورة - اسم - سعر)
// وكمان يعرض العداد لكن مش هو اللي بيغير القيمة
// بياخد الكمية والفنكشنز من الصفحة الرئيسية

import 'package:flutter/material.dart';
import 'quantity.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class Cartcard extends StatelessWidget {
  final String nameCart, imageCart, priceCart;

  // الكمية جاية من برّه
  final int quantity;

  // الفنكشنز جاية من الصفحة الأب
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onDelete;

  const Cartcard({
    super.key,
    required this.nameCart,
    required this.imageCart,
    required this.priceCart,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 10.0, right: 10.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // صورة المنتج
                  Container(
                    width: 105,
                    height: 111,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ImageUrlUtils.getFullUrl(imageCart),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // بيانات المنتج
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameCart,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text('vally farms'),
                        ],
                      ),

                      SizedBox(height: 34),

                      Text(
                        priceCart,
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // العداد على اليمين
        Positioned.directional(
          textDirection: Directionality.of(context),
          end: 15,
          top: 15,
          child: IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          end: 20,
          bottom: 10,
          child: QuantityCounter(
            quantity: quantity,
            onIncrease: onIncrease,
            onDecrease: onDecrease,
          ),
        ),
      ],
    );
  }
}
