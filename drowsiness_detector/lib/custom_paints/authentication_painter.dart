import 'package:flutter/material.dart';

class RegisterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()..color = Colors.deepOrange.shade400;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.quadraticBezierTo(size.width * 0.8898148, size.height * 0.2497527,
        size.width * 0.5000000, size.height * 0.2472799);
    path_0.quadraticBezierTo(
        size.width * 0.1361111, size.height * 0.2509891, 0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
