import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const IconCard({required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF3D4852),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Icon(
          icon,
          color: Colors.black,
          size: 80,
        ),
      ],
    );
  }
}
