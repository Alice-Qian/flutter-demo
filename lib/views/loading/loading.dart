import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration(seconds: 3), () {
      //3秒后跳转到其他路由
      Navigator.of(context).pushReplacementNamed("/tutorial");
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Image.asset("images/bg.png", fit: BoxFit.cover));
  }
}
