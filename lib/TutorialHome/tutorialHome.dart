import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/ProgressRoute/progressRoute.dart';
import '../Tapbox/tapbox.dart';
import '../FormRoute/formRoute.dart';
import '../ProgressRoute/progressRoute.dart';
import '../MyDrawer/myDrawer.dart';
import '../SingleChildScrollViewRoute/SingleChildScrollViewRoute.dart';
import '../InfiniteListView/infiniteList.dart';

class TutorialHome extends StatefulWidget {
  @override
  _TutorialHome createState() => new _TutorialHome();
}

class _TutorialHome extends State<TutorialHome> {
  int _counter = 0;
  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    print(index);
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new SingleChildScrollViewRoute();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new FormRoute();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return new InfiniteListView();
        }));
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  final wordPair = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.5,
        brightness: Brightness.light,
        backgroundColor: Colors.blue,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: new Text('Example title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.arrow_forward),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TipRoute(
                  // 路由参数
                  text: "我是提示321",
                );
              }));
            },
          ),
        ],
      ),
      //body占屏幕的大部分
      drawer: new MyDrawer(),
      body: new Center(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('Count: $_counter'),
            Text(
              wordPair.toString(),
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            new Image.network(
              //图片地址
              'https://img04.sogoucdn.com/app/a/100520093/ac75323d6b6de243-0bd502b2bdc1100a-92cef3b2299cfc6875afe7d5d0b83a7b.jpg',
              //填充模式
              fit: BoxFit.fitWidth,
              width: 100,
              height: 100,
            ),
            Image.asset(
              'images/tag.png',
              width: 100,
              height: 100,
            ),
            IconButton(
              icon: Icon(Icons.alarm),
              onPressed: () {
                return showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("测试对话框"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                        ),
                        FlatButton(
                          child: Text("删除"),
                          onPressed: () {
                            //关闭对话框并返回true
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Container(
              width: 400,
              height: 80,
              color: Colors.red,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    child: Text("hello world"),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("I am Jack",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            height: 1.2,
                            fontFamily: "Courier",
                            background: new Paint()..color = Colors.yellow,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed)),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orangeAccent]),
                borderRadius: BorderRadius.circular((3.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                child: Text('Test', style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight,
                transform: new Matrix4.skewY(0.3),
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('freedom'),
                ),
              ),
            )
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: _increment,
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  // Key类似与vue的key 决定在下一次build的时候是否复用widget
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("提示")),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text("返回"),
                onPressed: () => {
                  Navigator.pop(context, "我是返回值"),
                },
              )
            ],
          )),
        ));
  }
}
