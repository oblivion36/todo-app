import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  final double width, height, radius;
  final Color baseColor, highlightColor;
  final BorderRadius? borderRadius;

  const LoadingWidget({
    Key? key,
    required this.width,
    required this.height,
    this.radius = 0.0,
    this.borderRadius,
    this.baseColor = const Color(0xFFdadada),
    this.highlightColor = const Color(0xFFFBEFC9),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _borderRadius = BorderRadius.zero;
    if (borderRadius != null) {
      _borderRadius = borderRadius!;
    } else if (radius != 0.0) {
      _borderRadius = BorderRadius.circular(radius);
    }

    return ClipRRect(
        borderRadius: _borderRadius,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
        ));
  }
}
