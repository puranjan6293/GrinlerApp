// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:grinler/theme/pallete.dart';

class FollowCount extends StatelessWidget {
  final int count;
  final String text;
  const FollowCount({
    Key? key,
    required this.count,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = 18;
    return Column(
      children: [
        Text(
          '$count',
          style: TextStyle(
              color: Pallete.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 3,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            text,
            style: TextStyle(
              color: Pallete.whiteColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
