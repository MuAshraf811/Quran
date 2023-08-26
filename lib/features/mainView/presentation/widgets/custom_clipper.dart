

import 'package:flutter/material.dart';

class UpperColumnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(0, height / 2);
    myPath.quadraticBezierTo(width / 2, height, width, height / 2);
    myPath.lineTo(width, 0);
    myPath.close();
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class LowerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(0, height / 2);
    myPath.quadraticBezierTo(width / 2, height, width, height / 2);
    myPath.lineTo(width, 0);

    myPath.quadraticBezierTo(width / 2, height / 2, 0, 0);
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
