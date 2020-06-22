/*
 * create_by: zq_hero
 * Date:  2020/6/17  11:34
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../router.dart';

class GlobalControl {
  static SharedPreferences prefs; //共享参数  配置项数据
  static JPushUtils jPushUtils = new JPushUtils();

  static Configuration config = new Configuration(); // 配置项

  //TODO
  static User user;

  //  //初始化  全局变量 和数据
  static Future initApp() async {
    prefs = await SharedPreferences.getInstance();

    var _configData = prefs.getString("config");
    if (_configData != null) {
      try {
        config = Configuration.fromJson(jsonDecode(_configData));
        print("--用户配置信息config:---${config.toJson()}");
      } catch (e) {
//        Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        print("=========config=====json解析异常==================${e}");
      }
    }

    //TODO  考虑是否应该  存到数据库
    var _userData = prefs.getString("user");
    if (_userData != null) {
      try {
        user = User.fromJson(jsonDecode(_configData));
        print("--用户配置信息:user---${user.toJson()}");
        if (config.isOpenPush) {
          jPushUtils.initJPush("0d44f95f3d5ba97f0931bbc0", user.phoneNum,
              true); //AppKey   alias   isDebug
        }
      } catch (e) {
        print("============user==json解析异常==================${e}");
      }
    }
  }

  // 持久化Pref信息
  static savePreferences() async {
    await prefs.setString("config", jsonEncode(config?.toJson()));
    await prefs.setString("user", jsonEncode(user?.toJson()));
  }
}
