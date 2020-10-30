import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/cart_page.dart';
import 'package:flutter_shop/page/category_page.dart';
import 'package:flutter_shop/page/home_page.dart';
import 'package:flutter_shop/page/member_page.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:provide/provide.dart';

//引导页
class IndexPage extends StatelessWidget {
  final List<Widget> pageList = [
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
  IndexPage();

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context,
        designSize: Size(720, 1280), allowFontScaling: false);
    return Provide<CurrentIndexProvide>(
      builder: (context, child, value) {
        int currentIndex = Provide.value<CurrentIndexProvide>(context).index;
        return Scaffold(
            backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[50],
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: bottomTab,
              onTap: (value) {
                Provide.value<CurrentIndexProvide>(context).changeIndex(value);
              },
              currentIndex: currentIndex,
            ),
            body: IndexedStack(
              index: currentIndex,
              children: pageList,
            ));
      },
    );
  }
}

// class IndexPage extends StatefulWidget {
//   IndexPage({Key key}) : super(key: key);

//   @override
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
//   int _currtent = 0;

//   List<Widget> pageList = [
//     HomePage(),
//     CategoryPage(),
//     CartPage(),
//     MemberPage(),
//   ];

//   List<BottomNavigationBarItem> bottomTab = [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home),
//       label: "首页",
//     ),
//     BottomNavigationBarItem(icon: Icon(Icons.search), label: "分类"),
//     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物车"),
//     BottomNavigationBarItem(icon: Icon(Icons.person), label: "会员中心"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
//     ScreenUtil.init(context,
//         designSize: Size(720, 1280), allowFontScaling: false);
//     return Scaffold(
//         backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.grey[50],
//           selectedItemColor: Colors.red,
//           unselectedItemColor: Colors.grey,
//           items: bottomTab,
//           onTap: (value) {
//             setState(() {
//               _currtent = value;
//             });
//           },
//           currentIndex: _currtent,
//         ),
//         body: IndexedStack(
//           index: _currtent,
//           children: pageList,
//         ));
//   }
// }
