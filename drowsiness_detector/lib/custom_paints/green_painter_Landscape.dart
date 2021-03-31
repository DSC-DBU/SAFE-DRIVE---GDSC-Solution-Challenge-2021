import 'package:flutter/material.dart';

class GreenPainterLandscape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()..color = Colors.deepOrange.shade400;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(
        size.width * 0.5555556, 0, size.width * 0.7407407, 0);
    path_0.cubicTo(
        size.width * 0.6807407,
        size.height * 0.4474074,
        size.width * 0.3859259,
        size.height * 0.7333333,
        0,
        size.height * 0.7407407);
    path_0.quadraticBezierTo(0, size.height * 0.5555556, 0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Colors.deepOrange.shade400.withOpacity(0.3);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9259259, size.height * 0.1296296);
    path_1.lineTo(size.width * 0.9259259, size.height);
    path_1.quadraticBezierTo(size.width * 0.8447222, size.height * 0.7942593,
        size.width * 0.8055556, size.height * 0.4629630);
    path_1.quadraticBezierTo(size.width * 0.7825000, size.height * 0.2305556,
        size.width * 0.9259259, size.height * 0.1296296);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
