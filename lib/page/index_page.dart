import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/page/cart_page.dart';
import 'package:flutter_shop/page/category_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:flutter_shop/page/member_page.dart';

//引导页
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currtent = 0;

  List<Widget> pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  List<BottomNavigationBarItem> bottomTab = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "首页",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "分类"),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物车"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "会员中心"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[50],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: bottomTab,
          onTap: (value) {
            setState(() {
              _currtent = value;
            });
          },
          currentIndex: _currtent,
        ),
        body: IndexedStack(
          index: _currtent,
          children: pageList,
        ));
  }
}
