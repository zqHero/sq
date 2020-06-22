import 'dart:async';
import 'package:jpush_flutter/jpush_flutter.dart';

//极光  推送  处理
class JPushUtils {
  String debugLable = 'JPushDebug==========log==:';
  final JPush jpush = new JPush();

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initJPush(String appKey, String phoneNum, bool isDebug) async {
    jpush.setup(
      appKey: appKey, //你自己应用的 AppKey
      channel: "developer-default",
      production: true,
      debug: isDebug, //TODO  记得关闭  debug 模式：
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));
    Future.delayed(Duration.zero, () {
      //需要延迟  设置
      jpush.setAlias(phoneNum).then((value) {}).catchError((error) {
        print("JpushError::::::::::::${error}");
      });
    });
  }

  //判断  用户是否打开了   通知权限
  Future<bool> isOpenNatification() {
    return jpush.isNotificationEnabled();
  }

  //去设置界面打开  通知权限
  void openNotificationSetting() {
    return jpush.openSettingsForNotification();
  }

  //设置 Push 状态  打开或者关闭 ：
  void setPushStatus(bool isOpenPush) {
    if (isOpenPush) {
      jpush.resumePush();
    } else {
      jpush.stopPush();
    }
  }
}
