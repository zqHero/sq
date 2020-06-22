/*
 * create_by: zq_hero
 * Date:  2020/6/18  9:38
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../router.dart';

class TabContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TabContainerState();
  }
}

class TabContainerState extends State<TabContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("1#车间预警"),
        bottom: TabBar(
          tabs: [
            Tab(text: "未处理"),
            Tab(text: "已处理"),
            Tab(text: "已忽略"),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TabOnePage(),
          TabSecondPage(),
          TabThirdPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
