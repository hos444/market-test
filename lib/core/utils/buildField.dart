import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class buildField extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const buildField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<buildField> createState() => _buildFieldState();
}

class _buildFieldState extends State<buildField> {
  bool isObscure = true; // 👈 للتحكم في إظهار الباسورد

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? isObscure : false,
      cursorColor: const Color(0xFF007AFF),

      decoration: InputDecoration(
        hintText: widget.hint,

        /// 🔹 أيقونة البداية
        prefixIcon: Icon(widget.icon, color: Colors.green),

        /// 🔥 أيقونة العين
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green.shade200),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
        ),
      ),
    );
  }
}