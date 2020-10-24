import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:provide/provide.dart';

//分类顶部的类别信息
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(builder: (context, child, list) {
      return Container(
        height: ScreenUtil().setHeight(80),
        width: ScreenUtil().setWidth(520),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Colors.grey.shade200,
            ))),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.childList.length,
          itemBuilder: (BuildContext context, int index) {
            return _rightInkWell(list.childList[index]);
          },
        ),
      );
    });
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}
