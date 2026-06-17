import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class ElBotton extends StatelessWidget {
  final String titel;
  final VoidCallback onPressed;
  const ElBotton({super.key, required this.titel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(
        titel,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
