import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  ColorContainer({required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
