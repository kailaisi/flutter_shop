import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:provide/provide.dart';
import 'package:shared_preferences/shared_preferences.dart';

//购物车
class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> list = [];
  @override
  Widget build(BuildContext context) {
    _show();
    return Container(
      child: Column(
        children: [
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("${list[index]}");
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              _add();
            },
            child: Text("增加"),
          ),
          RaisedButton(
            onPressed: () {
              _clear();
            },
            child: Text("清空"),
          ),
        ],
      ),
    );
  }

  _add() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    list.add("你牛逼");
    sp.setStringList("setInfo", list);
    sp.commit();
    _show();
  }

  _show() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getStringList("setInfo") != null) {
      setState(() {
        list = sp.getStringList("setInfo");
      });
    }
  }

  _clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("setInfo");
    setState(() {
      list = [];
    });
  }
}
