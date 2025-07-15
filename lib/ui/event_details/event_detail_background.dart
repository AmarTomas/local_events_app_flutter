import 'package:flutter/material.dart';
import '../../Model/event.dart';
import 'package:provider/provider.dart';
class EventDetailsBackground extends StatelessWidget {
  const EventDetailsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    final event=Provider.of<Event>(context);
    return  Align(
      alignment: Alignment.topCenter,
      child:ClipPath(
      clipper: ImageClipper(),
      child: Image.asset(event.imagePath!,
          width: screenWidth,
          fit: BoxFit.cover,
          color: const Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          height: screenHeight *0.5,),
      ),
    );
  }
}
class ImageClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    Offset curveStartPoint=const Offset(0, 40);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy-5);
    Offset curveEndPoint=Offset(size.width, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.8, curveEndPoint.dx-60, curveEndPoint.dy+10);
    path.quadraticBezierTo(size.width * 0.99, size.height * 0.99, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
  return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}
