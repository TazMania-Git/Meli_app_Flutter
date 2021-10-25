import 'package:flutter/material.dart';

class CircularIndicatorMeli extends StatefulWidget {
  CircularIndicatorMeli({Key? key}) : super(key: key);

  @override
  _CircularIndicatorMeliState createState() => _CircularIndicatorMeliState();
}

class _CircularIndicatorMeliState extends State<CircularIndicatorMeli>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 1), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 4,
        valueColor: animationController.drive(ColorTween(
          begin: Colors.yellow,
          end: Colors.blue,
        )),
      ),
    );
  }
}
