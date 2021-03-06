import 'package:flutter/material.dart';
import 'package:my_app/views/heroAnimation/heroAnimation.dart';
import '../themeRoute/themeRoute.dart';
import '../httpRoute/httpRoute.dart';
import '../scaleAnimation/scaleAnimation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.asset(
                          'images/tag.png',
                          width: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Wendux",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("主题切换"),
                    subtitle: const Text("change theme"),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new ThemeRoute();
                      }))
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('请求测试'),
                    subtitle: const Text("test request"),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new HttpRoute();
                      }))
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('动画演示'),
                    subtitle: const Text("animation"),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new ScaleAnimation();
                      }))
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Hero动画'),
                    subtitle: const Text("animation"),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new HeroAnimation();
                      }))
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
