import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final Color color;
  final Color textColor;
  final Color? borderColor;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: textColor, fontSize: 16)),
          SizedBox(width: 10),
          SvgPicture.asset(icon, height: 24, width: 24),
        ],
      ),
    );
  }
}
