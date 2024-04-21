import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final double value1; // 200
  final double animValue1; // static value1 = 50.0
  final double animValue2; //static value1 = 75.0
  final double animValue3; //static value1 = 75.0

  CurvePainter({
    required this.value1,
    required this.animValue1,
    required this.animValue2,
    required this.animValue3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.moveTo(101, value1);
    path.quadraticBezierTo(101, value1 + 25, animValue3,
        value1 + 25); // have to use animValue3 for x2
    path.lineTo(animValue1, value1 + 25); // have to use animValue1 for x
    path.quadraticBezierTo(animValue2, value1 + 25, animValue2,
        value1 + 50); // animValue2 = 25 // have to use animValue2 for both x
    path.lineTo(101, value1 + 50);
    // path.quadraticBezierTo(25, value1 + 60, 50, value1 + 60);
    // path.lineTo(75, value1 + 60);
    // path.quadraticBezierTo(101, value1 + 60, 101, value1 + 80);
    path.close();

    path.moveTo(101, value1 + 100);
    path.quadraticBezierTo(101, value1 + 75, animValue3, value1 + 75);
    path.lineTo(animValue1, value1 + 75);
    path.quadraticBezierTo(animValue2, value1 + 75, animValue2, value1 + 50);
    path.lineTo(101, value1 + 50);
    path.close();

    paint.color = const Color.fromARGB(255, 216, 216, 216);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
