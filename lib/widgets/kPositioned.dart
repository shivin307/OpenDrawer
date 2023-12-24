import 'package:flutter/cupertino.dart';

Positioned customPositioned(double height, double width, double left,
    double top, Color color, double radius) {
  return Positioned(
    left: left,
    top: top,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
    ),
  );
}
