import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatefulWidget {
  final String image;
  final String name;
  const CategoryHome({super.key, required this.image, required this.name});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          //
          borderRadius: BorderRadius.circular(30), // الشكل الدائري
          border: Border.all(color: Colors.grey.shade600, width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: Image.asset(widget.image, fit: BoxFit.contain),
            ),
            SizedBox(width: 8),
            Text(
              widget.name,
              style: TextStyle(
                color: const Color.fromARGB(
                  255,
                  12,
                  88,
                  68,
                ), // زي الصورة (Dark mode)
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(), // 2 = Cart
          ),
        );
      },
    );
  }
}
