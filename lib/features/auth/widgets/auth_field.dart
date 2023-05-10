import 'package:flutter/material.dart';
import 'package:grinler/theme/pallete.dart';

class AuthField extends StatelessWidget {
  // controller make different instance for every textFormField
  final TextEditingController controller;
  final String hintText;
  const AuthField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Pallete.blueColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Pallete.greyColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}
