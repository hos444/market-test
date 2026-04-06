import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class ElevatedBotton extends StatelessWidget {
  const ElevatedBotton({super.key});

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
      child: const Text('text here'),
    );
  }
}
