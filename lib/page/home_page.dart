import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
        children: [
          TextField(
            controller: typeControl,
            decoration: InputDecoration(
              labelText: '类型',
              helperText: '',
            ),
            autofocus: false,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("确定"),
          ),
          Text(
            "欢迎你",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      )),
    );
  }
}
