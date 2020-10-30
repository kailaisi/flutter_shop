import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/page/index_page.dart';
import 'package:flutter_shop/routers/applicaton.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import 'routers/routes.dart';

class AppComponent extends StatefulWidget {
  AppComponent({Key key}) : super(key: key);

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
    JPush jpush = new JPush();
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
    );
    jpush.setup(
      appKey: "eaab30c088155e3386df9ea6",
      channel: "theChannel",
      production: false,
      debug: true, // 设置是否打印 debug 日志
    );
    jpush.getRegistrationID().then((rid) {
      print("对应的ID:$rid");
    });
    final app = MaterialApp(
      title: "生活+",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: IndexPage(),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
