/*
 * create_by: zq_hero
 * Date:  2020/6/17  10:29
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../router.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MinePageState();
  }
}

class MinePageState extends State<MinePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Container(),
    );
  }
}
