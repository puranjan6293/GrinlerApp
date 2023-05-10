import 'package:flutter/material.dart';
import 'package:grinler/theme/pallete.dart';

class AuthRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const AuthRoundedButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.backgroundColor = Pallete.whiteColor,
      this.textColor = Pallete.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      ),
    );
  }
}
