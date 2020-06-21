import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  @override
  _ScaleAnimation createState() => new _ScaleAnimation();
}

class _ScaleAnimation extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动画演示'),
        ),
        body: new Center(
          child: Image.asset("images/loading.png",
              width: animation.value, height: animation.value),
        ));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
