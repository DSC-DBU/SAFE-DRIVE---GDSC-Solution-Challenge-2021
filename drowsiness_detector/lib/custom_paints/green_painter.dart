import 'package:flutter/material.dart';

class GreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.deepOrange.shade400.withOpacity(0.8);

    Path path = Path();
    path.moveTo(size.width * -0.0000000, size.height * -0.0016485);
    path.quadraticBezierTo(size.width * 0.5555556, size.height * -0.0016485,
        size.width * 0.7407407, size.height * -0.0016485);
    path.cubicTo(
        size.width * 0.7231667,
        size.height * 0.3081355,
        size.width * 0.4118889,
        size.height * 0.6159990,
        0,
        size.height * 0.6181998);
    path.quadraticBezierTo(size.width * 0.0024630, size.height * 0.4942631,
        size.width * -0.0000000, size.height * -0.0016485);
    path.close();
    canvas.drawPath(path, paint);

    Paint paint_0 = new Paint()
      ..color = Colors.deepOrange.shade400.withOpacity(0.3);

    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.2198124);
    path_0.quadraticBezierTo(size.width * 0.7427963, size.height * 0.2965416,
        size.width * 0.7407407, size.height * 0.5128957);
    path_0.quadraticBezierTo(size.width * 0.7429630, size.height * 0.7363277,
        size.width, size.height * 0.9964830);
    path_0.lineTo(size.width, size.height * 0.2198124);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
