import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class ElevatedBotton extends StatelessWidget {
  final String titel;
  const ElevatedBotton({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.success,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(titel, style: TextStyle(color: AppColors.scaffold)),
    );
  }
}
