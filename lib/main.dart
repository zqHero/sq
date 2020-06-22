import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info/package_info.dart';
import 'package:provide/provide.dart';
import 'package:sq/router.dart';

import 'example/floor/entity/person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize(); //  初始化  文件下载类

//  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
//  final personDao = database.personDao;
//  final person = Person(1, 'Frank');
//  await personDao.insertPerson(person);
//  final result = await personDao.findPersonById(1);

  // 引入状态 管理器：
  var globalProvide = GlobalProvide(); //全局数据 状态管理

  var providers = Providers();

  providers..provide(Provider<GlobalProvide>.value(globalProvide));

  GlobalControl.initApp().then((e) async {
    try {
      JPushUtils().jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("接收到通知类型消息 onReceiveNotification: $message");
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("用户点击了通知 onOpenNotification : $message");
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("接收到自定义消息类型 onReceiveMessage : $message");
      });
    } on PlatformException {
      print("============jpush 添加监听 失败：========================");
    }
    return runApp(ProviderNode(child: MyApp(), providers: providers));
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }
}

class MainState extends State<MyApp> {
  //所有  界面跳转 路由 初始化：
  static Map<String, WidgetBuilder> pageRoutes = {
    "LoginPage": (context) => LoginPage(), //登录界面

    "MainPage": (context) => MainPage(), //主界面实现方式1

    "HomePage1": (context) => HomePage1(), //首页
    "HomePage2": (context) => HomePage2(), //预警
    "HomePage3": (context) => HomePage3(), //分析
    "MinePage": (context) => MinePage(), //我的

    "TabContainer": (context) => TabContainer(), //车间预警 列表    未处理 已处理  已忽略
    "TabOnePage": (context) => TabOnePage(), //未处理
    "TabSecondPage": (context) => TabSecondPage(), //已处理
    "TabThirdPage": (context) => TabThirdPage(), //已忽略
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PackageInfo.fromPlatform().then((packageInfo) {
      //设置当前  记录到全局   状态类中
      Provide.value<GlobalProvide>(context).setAppVersion(packageInfo.version);
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provide.value<GlobalProvide>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          platform: TargetPlatform.iOS,
          primaryColor: Configs.defaultThemeColor,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          )),
//      home: user != null ? HomePage() : LoginPage(),
      home: LoginPage(),
      routes: pageRoutes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalEasyRefreshLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('zh', 'CN'),
      ],
    );
  }
}
