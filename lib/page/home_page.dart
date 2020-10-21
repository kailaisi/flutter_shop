import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/home/lead_phone.dart';
import 'package:flutter_shop/service/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeContentRes;
  @override
  void initState() {
    super.initState();
    getHomePageContent().then((value) => {
          setState(() =>
              {print(value.toString()), homeContentRes = value.toString()})
        });
  }

  final typeControl = TextEditingController();
  var showText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美好人间")),
      body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              var data = snapshop.data;
              List<Map> swipter = (data["data"]["slides"] as List).cast();
              String leaderImg = data["data"]["shopInfo"]["leaderImage"];
              String leaderPhone = data["data"]["shopInfo"]["leaderPhone"];
              return Container(
                  child: Column(
                children: [
                  SwiperDiy(list: swipter),
                  LeadPhone(
                    url: leaderImg,
                    phone: leaderPhone,
                  )
                ],
              ));
            } else {
              return Center();
            }
          }),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List<Map> list;
  SwiperDiy({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      child: Swiper(
        itemCount: list.length,
        pagination: new SwiperPagination(),
        loop: true,
        itemBuilder: (context, index) {
          return Image.network("${list[index]['image']}", fit: BoxFit.cover);
        },
      ),
    );
  }
}
