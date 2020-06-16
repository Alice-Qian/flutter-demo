import 'package:flutter/material.dart';

class ThemeRoute extends StatefulWidget {
  @override
  _ThemeRoute createState() => new _ThemeRoute();
}

class _ThemeRoute extends State<ThemeRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor,
          iconTheme: IconThemeData(color: _themeColor)),
      child: Scaffold(
        appBar: AppBar(title: Text('主题切换')),
        body: Column(
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text('颜色跟随主题')
            ]),
            // 为第二行Icon自定义颜色 copyWith
            Theme(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text('颜色固定黑色')
                  ],
                ),
                data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.teal[300])))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            setState(() => {
                  _themeColor =
                      _themeColor == Colors.teal ? Colors.blue : Colors.teal
                })
          },
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}
