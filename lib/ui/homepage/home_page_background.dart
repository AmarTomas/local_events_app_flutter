// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
class HomePageBackground extends StatelessWidget {
  final screenHeight;
  const HomePageBackground({ required this.screenHeight,super.key});

  @override
  Widget build(BuildContext context) {
    final themeData=Theme.of(context);
    return ClipPath(
      clipper: BottomShapeClipper(),
      child: Container(
        height: screenHeight * 0.5,
        color: themeData.primaryColor,
      ),
    );
  }
}

class BottomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
 Path path=Path();
 Offset curveStartPoint=Offset(0, size.height * 0.85);
 Offset curveEndPoint=Offset(size.width, size.height * 0.85);
 path.lineTo(curveStartPoint.dx, curveEndPoint.dy);
 path.quadraticBezierTo(size.width/2,size.height, curveEndPoint.dx, curveEndPoint.dy);
 path.lineTo(size.width,0);
 return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  return true;
  }
}
