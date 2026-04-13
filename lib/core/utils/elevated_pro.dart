import 'package:flutter/material.dart';
class TextFieldPro extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String) onChanged;

  final IconData? icon;
  final bool isPassword;

  const TextFieldPro({
    super.key,
    required this.controller,
    required this.label,
    required this.onChanged, // 👈 إجباري
    this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,

        prefixIcon: icon != null ? Icon(icon) : null,

        filled: true,
        fillColor: Colors.grey[200],

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
