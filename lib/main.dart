import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './config/config.dart';
import './views/loading/loading.dart';
import './views/tutorialHome/tutorialHome.dart';

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(new MyApp());
// }
void main() {
  Config.env = Env.DEVELOP;
  print(1111);
  print(Config.apiHost);
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loading(),
      theme: ThemeData(
          //主题色
          primaryColor: Color(0xff303030),
          //中间的屏幕背景色
          // scaffoldBackgroundColor: Color(0xFFebebeb),
          cardColor: Color(0xff393a3f)
      ),
      routes: <String, WidgetBuilder>{
        "/tutorial": (context) => TutorialHome(),
      },
    );
  }
}
