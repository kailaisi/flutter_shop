import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/home/ab_banner.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'home/top_navigator.dart';
import 'home/top_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _chose() {
    if (typeControl.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("类型是空")),
      );
    } else {
      _http(typeControl.text.toString()).then((value) => {
            setState(() {
              showText = value["data"]["name"];
            })
          });
    }
  }

  Future _http(String input) async {
    Response response;
    var data = {'name': input};
    response = await Dio().post(
        "http://test.baixingliangfan.cn/baixing/wxmini/homepageContent",
        queryParameters: data);
    print(response);
    return response.data;
  }

  final typeControl = TextEditingController();
  var showText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美好人间")),
      body: Container(
          child: Column(children: [
        SwiperDiy(),
        TopNavigator(),
        AdBanner(
            url:
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1603214939353&di=063f765fa38e58dca8c60b7f84b90b57&imgtype=0&src=http%3A%2F%2Fimages.cntrades.com%2F201011%2F17%2F08-40-19-48-391842.gif"),
      ])),
    );
  }
}
