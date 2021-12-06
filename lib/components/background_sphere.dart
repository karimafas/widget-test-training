import 'package:flutter/material.dart';

class BackgroundSphere extends StatelessWidget {
  const BackgroundSphere({
    Key? key,
    required this.beginColor,
    required this.endColor,
    required this.size,
    required this.alignment,
  }) : super(key: key);

  final Color beginColor;
  final Color endColor;
  final double size;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [beginColor, endColor]),
              borderRadius: BorderRadius.circular(100)),
        ),
      ],
    );
  }
}