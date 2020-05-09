import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final progress;
  
  final Color primaryColor;
  final Color secondaryColor;

  final double primaryStrokeWidth;
  final double secondaryStrokeWidth;

  const RadialProgress({ 
    @required this.progress, 

    this.primaryColor = Colors.lightBlueAccent, 
    this.secondaryColor = Colors.grey,

    this.primaryStrokeWidth = 10.0,
    this.secondaryStrokeWidth = 5.0, 
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double prevProgress;

  @override
  void initState() {
    
    prevProgress = widget.progress;

    controller = new AnimationController(vsync: this, duration: Duration( milliseconds: 300 ));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0.0 );

    final difference = widget.progress - prevProgress;
    prevProgress = widget.progress;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,

          child: CustomPaint(
            painter: _CircularProgress(
              ( widget.progress - difference ) + ( difference * controller.value ),
              widget.primaryColor,
              widget.secondaryColor,
              widget.primaryStrokeWidth,
              widget.secondaryStrokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _CircularProgress extends CustomPainter {

  final progress;
  
  final Color primaryColor;
  final Color secondaryColor;

  final double primaryStrokeWidth;
  final double secondaryStrokeWidth;

  _CircularProgress( 
    this.progress, 
    this.primaryColor,
    this.secondaryColor, 
    this.primaryStrokeWidth,
    this.secondaryStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    
    // Complete circle

    final paint = new Paint()
      ..strokeWidth = secondaryStrokeWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min( size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle(center, radius, paint);

    // Progress

    final paintProgress = new Paint()
      ..strokeWidth = primaryStrokeWidth
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double progressFill = 2 * pi * ( progress / 100 );

    canvas.drawArc(
      Rect.fromCircle( center: center, radius: radius ), 
      -pi / 2, 
      progressFill, 
      false, 
      paintProgress
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}