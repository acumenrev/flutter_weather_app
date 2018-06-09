import 'dart:ui';
import 'package:flutter/material.dart';
import '../../circle.dart';

class BackgroundWithRings extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Stack(
        fit: StackFit.expand,
       children: <Widget>[
         new Image.asset(
           'resources/images/weather-bk.png',
           fit: BoxFit.cover,
         ),
         new ClipOval(
          clipper: new CircleClipper(
            radius: 140.0,
            offset: const Offset(40.0, 0.0),
          ),
          child: new Image.asset(
           'resources/images/weather-bk_enlarged.png',
           fit: BoxFit.cover
          ),
         ),
         new CustomPaint(
           painter: new WhiteCircleCutoutPainter(
             centerOffset: const Offset(40.0, 0.0),
             circles: circles
           ),
           child: new Container(

           ),
         ) 
       ],
      );
    }
}

class CircleClipper extends CustomClipper<Rect> {
  final double radius;
  final Offset offset;
  CircleClipper({
    this.radius,
    this.offset = const Offset(0.0, 0.0)
  });

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromCircle(
        center: new Offset(0.0, size.height/2) + offset,
        radius: radius
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class WhiteCircleCutoutPainter extends CustomPainter {
  final Color overlayColor = const Color(0xFFAA88AA);

  final List<Circle> circles;
  final Offset centerOffset;
  final Paint whitePaint;
  final Paint borderPaint;

  WhiteCircleCutoutPainter({
    this.circles,
    this.centerOffset = const Offset(0.0, 0.0),
  }) : whitePaint = new Paint(),
      borderPaint = new Paint() {
        borderPaint
        ..color = const Color(0x10FFFFFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    for (var i = 1; i< circles.length; i++) {
      _maskCircle(canvas, size, circles[i].radius);

      whitePaint.color = overlayColor.withAlpha(circles[i-1].alpha);

      // fill the circle
      canvas.drawCircle(
        new Offset(0.0, size.height/2) + centerOffset ,
        circles[i].radius, 
        whitePaint);

      canvas.drawCircle(
        new Offset(0.0, size.height/2) + centerOffset, 
        circles[i - 1].radius, 
        borderPaint);
    }

    _maskCircle(canvas, size, circles.last.radius);

    whitePaint.color = overlayColor.withAlpha(circles.last.alpha);

    canvas.drawRect(
      new Rect.fromLTWH(0.0, 0.0, size.width, size.height), 
      whitePaint);
    
    canvas.drawCircle(
      new Offset(0.0, size.height/2) + centerOffset, 
      circles.last.radius, 
      borderPaint);
  }

  void _maskCircle(Canvas canvas, Size size, double radius) {
    Path clippedCircle = new Path();
    clippedCircle.fillType = PathFillType.evenOdd;
    clippedCircle.addRect(
      new Rect.fromLTWH(0.0, 0.0, size.width, size.height)
    );
    clippedCircle.addOval(
      new Rect.fromCircle(
        center: new Offset(0.0, size.height/2) + centerOffset,
        radius: radius
      )
    );

    canvas.clipPath(clippedCircle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}