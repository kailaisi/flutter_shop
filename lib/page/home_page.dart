import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final typeControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美好人间")),
      body: Container(
          child: Column(
        children: [SwiperDiy()],
      )),
    );
  }
}

class SwiperDiy extends StatefulWidget {
  SwiperDiy({Key key}) : super(key: key);

  @override
  _SwiperDiyState createState() => _SwiperDiyState();
}

class _SwiperDiyState extends State<SwiperDiy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      child: Swiper(
        itemCount: 5,
        pagination: new SwiperPagination(),
        loop: true,
        itemBuilder: (context, index) {
          return Image.network(
              "https://t9.baidu.com/it/u=583874135,70653437&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1603790841&t=1af31f2923341c00b44036e7b5ed09f5",
              fit: BoxFit.cover);
        },
      ),
    );
  }
}
