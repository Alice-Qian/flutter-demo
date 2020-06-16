import 'package:flutter/material.dart';

class FormRoute extends StatefulWidget {
  @override
  _FormRoute createState() => new _FormRoute();
}

class _FormRoute extends State<FormRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名与邮箱",
                      icon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : '用户名不得为空';
                  },
                ),
                TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        icon: Icon(Icons.lock)),
                    obscureText: true,
                    //校验密码
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    }),
                Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(children: <Widget>[
                      Expanded(child: Builder(builder: (context) {
                        return RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState，context不对
                            // print(Form.of(context));

                            // 通过_formKey.currentState 获取FormState后，
                            // 调用validate()方法校验用户名密码是否合法，校验
                            // 通过后再提交数据。
                            if (Form.of(context).validate()) {
                              //验证通过提交数据
                              print(_unameController.text);
                              print(_pwdController.text);
                            }
                          },
                        );
                      })),
                    ]))
              ],
            ),
          ),
        ));
  }
}
