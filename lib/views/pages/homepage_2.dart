/*
 * create_by: zq_hero
 * Date:  2020/6/17  10:29
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage2State();
  }
}

class HomePage2State extends State<HomePage2> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("预警"),
      ),
      body: Container(
        width: ScreenUtil.screenWidth,
        child: Column(
          children: [
            Container(
              height: 50,
              width: 300,
              color: Colors.black12,
              child: GestureDetector(
                child: Text("预警信息item"),
                onTap: () {
                   Navigator.pushNamed(context, 'TabContainer');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
