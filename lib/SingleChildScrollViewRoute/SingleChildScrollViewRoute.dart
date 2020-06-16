import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
        appBar: AppBar(
          title: Text('scroll Test'),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
                child: Column(
                    children: str
                        .split("")
                        .map((c) => Text(c, textScaleFactor: 2.0))
                        .toList())),
          ),
        ));
  }
}
