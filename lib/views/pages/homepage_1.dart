import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sq/presenter/control/db_control.dart';

class HomePage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage1State();
  }
}

class HomePage1State extends State<HomePage1> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              title: Text("添加一行数据到DB"),
              onTap: () {
//                Fluttertoast.showToast(
//                    msg: "This is Center Short Toast",
//                    toastLength: Toast.LENGTH_SHORT,
//                    gravity: ToastGravity.CENTER,
//                    timeInSecForIosWeb: 1,
//                    backgroundColor: Colors.red,
//                    textColor: Colors.white,
//                    fontSize: 12
//                );
              },
            ),
            ListTile(
              title: Text("查询一行DB数据"),
              onTap: () {},
            ),
            ListTile(
              title: Text("删除一行DB数据"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
