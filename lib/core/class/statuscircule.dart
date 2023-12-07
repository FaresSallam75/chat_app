import 'package:flutter/material.dart';

class StatusPainter extends CustomPainter {
  bool isSeen;
  int seenNum;
  StatusPainter(this.isSeen, this.seenNum);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = isSeen ? Colors.deepOrange : const Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  degreeToAngle(double degree) {
    return (degree * 3.14) / 180;
  }

  drawArc(Canvas canvas, Size size, Paint paint) {
    if (seenNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / seenNum;
      for (int i = 0; i < seenNum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
