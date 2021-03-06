import 'package:flutter/material.dart';

class DrawHorizontalLine extends CustomPainter {
  Paint _paint;

  DrawHorizontalLine() {
    _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1   //line height
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-90.0, 0.0), Offset(90.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}