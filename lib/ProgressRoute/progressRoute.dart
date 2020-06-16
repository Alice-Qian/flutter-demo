import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRoute createState() => new _ProgressRoute();
}

class _ProgressRoute extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
            value: _animationController.value,
          ),
        )
      ],
    ));
  }
}
