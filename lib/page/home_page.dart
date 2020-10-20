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
        "https://www.fastmock.site/mock/306340adcb47aafb9461fa2841c58155/jd-eshop/dabaojianpost",
        queryParameters: data);
    print(response);
    return response.data;
  }

  final typeControl = TextEditingController();
  var showText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(title: Text("美好人间")),
      body: Container(
          child: Column(
        children: [SwiperDiy()],
      )),
    );
=======
        appBar: AppBar(title: Text("美好人间")),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              TextField(
                controller: typeControl,
                decoration: InputDecoration(
                  labelText: '类型',
                  helperText: '请输入需要的类型',
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: () {
                  _chose();
                },
                child: Text("确定"),
              ),
              Text(
                "$showText",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          )),
        ));
>>>>>>> b1cb7c29aa301e20299d18c95a58aaccf0340090
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
