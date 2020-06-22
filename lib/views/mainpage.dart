/*
 * create_by: zq_hero
 * Date:  2020/6/17  11:50
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../router.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  static _renderTabsIcon(String assets) {
    return Image.asset(assets,
        width: ScreenUtil().setWidth(70), height: ScreenUtil().setHeight(70));
  }

  static _renderTabsSelectedIcon(String assets) {
    return Image.asset(assets,
        width: ScreenUtil().setWidth(80), height: ScreenUtil().setHeight(80));
  }

  static _renderTxt(String txt) {
    return Text(txt, style: TextStyle(fontSize: 13));
  }

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        activeIcon: _renderTabsSelectedIcon('images/tab1_selected.png'),
        icon: _renderTabsIcon('images/tab1_normal.png'),
        title: _renderTxt("首页")),
    BottomNavigationBarItem(
        activeIcon: _renderTabsSelectedIcon('images/tab2_selected.png'),
        icon: _renderTabsIcon('images/tab2_normal.png'),
        title: _renderTxt("预警")),
    BottomNavigationBarItem(
        activeIcon: _renderTabsSelectedIcon('images/tab3_selected.png'),
        icon: _renderTabsIcon('images/tab3_normal.png'),
        title: _renderTxt("分析")),
    BottomNavigationBarItem(
        activeIcon: _renderTabsSelectedIcon('images/tab4_selected.png'),
        icon: _renderTabsIcon('images/tab4_normal.png'),
        title: _renderTxt("我的")),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: Configs.defaultDeviceWidthPix,
        height: Configs.defaultDeviceHieghtPix)
      ..init(context);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomePage1(), //食堂
          HomePage2(), //车辆
          HomePage3(), //服务
          MinePage(), //我的
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
