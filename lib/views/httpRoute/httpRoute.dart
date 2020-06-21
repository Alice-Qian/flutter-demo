import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import '../../models/initModel.dart';
import '../../api/api.dart';

class HttpRoute extends StatefulWidget {
  @override
  _HttpRoute createState() => new _HttpRoute();
}

class _ListItem extends StatelessWidget {
  InitModel _initModel;

  _ListItem(this._initModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_initModel.name), subtitle: Text(_initModel.desc));
  }
}

class _HttpRoute extends State<HttpRoute> {
  List _list;
  Future initState() {
    super.initState();
    _load();
  }

  _load() async {
    var res = await Api.init({"id": 12, "name": "wendu"});
    var list = res[0]['list'];

    setState(() {
      _list = list.map((json) => InitModel.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('测试请求'),
        ),
        body: new Container(
          alignment: Alignment.center,
          child: _list == null
              ? Text('loading')
              : ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _ListItem(_list[index]);
                  },
                ),
        ));
  }
}
