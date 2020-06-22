/*
 * create_by: zq_hero
 * Date:  2020/6/17  11:22
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 *
 * 本地 app  配置项 to  Object
 */
import 'package:flutter/cupertino.dart';

class Configuration {
  Configuration();

  bool isOpenPush = true;
  String appVersion = "0.0.1"; //当前用户手机的app版本号

  Color theme; //主题颜色

  Configuration.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
    isOpenPush = json['isOpenPush'];
    appVersion = json['appVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['theme'] = this.theme;
    data['isOpenPush'] = this.isOpenPush;
    data['appVersion'] = this.appVersion;
    return data;
  }
}
