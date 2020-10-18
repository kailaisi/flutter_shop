import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
  }
}
