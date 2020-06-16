import 'package:flutter/material.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListView createState() => new _InfiniteListView();
}

class _InfiniteListView extends State<InfiniteListView> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 100) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Test'),
      ),
      body: Column(children: <Widget>[
        ListTile(title: Text("商品列表")),
        Expanded(
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("商品$index"));
              }),
        ),
      ]),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () => {
                    _controller.animateTo(.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.ease)
                  }),
    );
  }
}
