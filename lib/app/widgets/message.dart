import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String image;
  final String message;
  final Color color;

  const Message({
    super.key,
    required this.image,
    required this.message,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Image.asset(image, width: 100, height: 100, fit: BoxFit.cover),
        Text(
          message,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
