import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final path = new Path();
    path.lineTo(0.0, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 27);
    var firstControl = Offset(size.width / 4, size.height - 45);

    path.quadraticBezierTo(
        firstControl.dx, firstControl.dy, firstEnd.dx, firstEnd.dy);

    var secondEnd = Offset(size.width, size.height - 70);
    var secondControl = Offset(3 * size.width / 4, size.height - 6);

    path.quadraticBezierTo(
        secondControl.dx, secondControl.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
