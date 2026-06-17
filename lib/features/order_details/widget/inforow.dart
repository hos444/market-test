import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class Inforow extends StatelessWidget {
  final String title;
  final String value;
  const Inforow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(
          text: "$title ",
          style: AppTextStyles.body.copyWith(color: Colors.black),
          children: [TextSpan(text: value, style: AppTextStyles.body)],
        ),
      ),
    );
    
  }
}
