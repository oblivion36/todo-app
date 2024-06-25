import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final Color color;
  final Color bordercolor;

  CustomCard({
    required this.icon,
    required this.name,
    required this.color,
    required this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 120,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(65),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: bordercolor)),
              child: Center(
                child: Icon(
                  icon,
                  color: color,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
