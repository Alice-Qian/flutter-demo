import 'package:flutter/material.dart';
import 'dart:async';
import '../../api/api.dart';

class HttpRoute extends StatefulWidget {
  @override
  _HttpRoute createState() => new _HttpRoute();
}

class _HttpRoute extends State<HttpRoute> {
  Future initState() {
    super.initState();
    _load();
  }

  _load() async {
    var res = await Api.init({"id": 12, "name": "wendu"});
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试请求'),
      ),
      body: new Container(
        alignment: Alignment.center,
      ),
    );
  }
}
