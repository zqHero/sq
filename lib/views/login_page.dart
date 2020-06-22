/*
 * create_by: zq_hero
 * Date:  2020/6/17  11:43
 * csdn:https://heroes.blog.csdn.net
 * github:https://github.com/zqHero
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../router.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();
  FocusNode _focusNodeAccount = new FocusNode();
  FocusNode _focusNodePwd = new FocusNode();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //去登录：
  _toValidateLogin() {
//    _focusNodeAccount.unfocus();
//    _focusNodePwd.unfocus();
//    if (phoneController.text.length != 11) {
//      DialogCommonWidget()
//          .showAlertDialog(context, KString.accountStyleInValidate);
//    } else if (passController.text.length < 6) {
//      DialogCommonWidget().showAlertDialog(context, KString.pwdtyleInValidate);
//    } else {
//      DioNet(context)
//          .toLogin(phoneController.text, passController.text)
//          .then((value) {
//        var data = json.decode(value.toString());
//        if (data != null && data["statusCode"] == 200) {
//          Provide.value<GlobalProvide>(context)
//              .setUser(User.fromJson(data["data"])); //更新数据状态
    Navigator.pushReplacementNamed(context, 'MainPage');
//        } else {
//          ToastUtil.toast(context,
//              "${data != null ? data["message"] : KString.requestFailInfoTxt}");
//        }
//      });
//    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: Configs.defaultDeviceWidthPix,
        height: Configs.defaultDeviceHieghtPix,
        allowFontScaling: true)
      ..init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(300),
              ),
              _renderInputFiled(),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 50, right: 50),
                child: MaterialButton(
                  onPressed: _toValidateLogin,
                  child: Text("去登录"),
                  minWidth: double.infinity,
                  height: ScreenUtil().setHeight(150),
                  textColor: Colors.green,
                  color: Configs.defaultThemeColor,
                ),
              ),
            ],
          )),
    );
  }

  //绘制  输入框
  Widget _renderInputFiled() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 35, bottom: 8),
          child: TextField(
            focusNode: _focusNodeAccount,
            controller: phoneController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: "请输入账号",
            ),
            autofocus: false,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 8, bottom: 20),
          child: TextField(
              focusNode: _focusNodePwd,
              autofocus: false,
              controller: passController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                labelText: "请输入密码",
              )),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passController.dispose();
    _focusNodePwd.dispose();
    _focusNodeAccount.dispose();
  }
}
