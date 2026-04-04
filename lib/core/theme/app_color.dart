import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // prevent creating object

  /// Primary Colors
  static  Color primary = Color.fromARGB(255, 83, 226, 91);
  static  Color secondary = Color(0xFF81C784);

  /// Background
  static const Color background = Color(0xFFF5F6FA);

  /// Text Colors
  static  Color textPrimary = Color(0xFF1A1A1A);
  static  Color textSecondary = Color(0xFF7A7A7A);

  /// Status Colors
  static  Color success = Colors.green;
  static  Color danger = Colors.red;
  static  Color warning = Colors.orange;

  /// Border & Divider
  static  Color border = Color(0xFFE0E0E0);
}