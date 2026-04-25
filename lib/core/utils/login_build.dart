import 'package:flutter/material.dart';

class LoginBuild extends StatefulWidget {
  final String hint;
  final IconData icon;
  final bool isPassword;

  const LoginBuild({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<LoginBuild> createState() => _BuildFieldState();
}

class _BuildFieldState extends State<LoginBuild> {
  bool isObscure = true; // 👈 للتحكم في إظهار الباسورد

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? isObscure : false,

      decoration: InputDecoration(
        hintText: widget.hint,

        /// 🔹 أيقونة البداية
        prefixIcon: Icon(widget.icon, color: Colors.green),

        /// 🔥 أيقونة العين
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
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

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green.shade200),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }
}
