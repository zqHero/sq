/*
 * create_by: zq_hero
 * Date:  2020/6/17  11:18
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 * 全局 数据  操作类：
 */
import 'package:flutter/cupertino.dart';
import '../../router.dart';

/// 全局数据  状态管理类：
class GlobalProvide extends ChangeNotifier {
  //应该从本地  取数据
  User get user => GlobalControl.user; //用户
  Color get theme => GlobalControl.config?.theme; // 主题
  bool get isOpenPush => GlobalControl.config?.isOpenPush; // 是否开启推送   默认开启
  String get appVersion => GlobalControl.config?.appVersion; //当前用户手机的  app版本号

  //设置  JPush状态
  void setPushStatus(bool isOpenPush) {
    GlobalControl.config.isOpenPush = isOpenPush;
    GlobalControl.jPushUtils.setPushStatus(isOpenPush);
    GlobalControl.savePreferences(); //保存sp变更
    notifyListeners();
  }

  //设置用户信息 状态：
  void setUser(User user) {
    GlobalControl.user = user;
    GlobalControl.savePreferences(); //保存sp变更
    notifyListeners();
  }

  //设置当前用户App版本号：
  void setAppVersion(String version) {
    GlobalControl.config?.appVersion = version;
    GlobalControl.savePreferences(); //保存sp变更
    notifyListeners();
  }

  //通知  清除部分用户数据:
  Future clearData() async {
    GlobalControl.config = null; //清空用户信息
    GlobalControl.user = null; //清空用户信息
    GlobalControl.prefs.clear(); //清除  共享参数
    notifyListeners();
  }
}
