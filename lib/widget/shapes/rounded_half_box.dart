import 'package:flutter/material.dart';

class RoundedHalfBox extends StatelessWidget {
  const RoundedHalfBox({
    Key? key,
    required this.width,
    required this.height,
    required this.curve,
    this.color = Colors.blue,
  }) : super(key: key);
  final double width, height, curve;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RoundedHalfBoxPainter(width, height, curve, color),
      size: Size(width, height),
    );
  }
}

// This is the Painter class
class RoundedHalfBoxPainter extends CustomPainter {
  RoundedHalfBoxPainter(this.width, this.height, this.curve, this.color);
  final width, height, curve;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    Path path = new Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(width, 0, width, curve);
    path.lineTo(width, height - curve);
    path.quadraticBezierTo(width, height, 0, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
