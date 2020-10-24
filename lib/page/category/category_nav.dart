import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<CategoryBigModel> list = [];
  var select = 0;
  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftNav(index);
        },
      ),
    );
  }

  Widget _leftNav(int index) {
    bool isSelect = false;
    var item = list[index];
    isSelect = (index == select) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          select = index;
        });
        Provide.value<ChildCategory>(context)
            .setChildCategory(item.bxMallSubDto);
      },
      child: Container(
        child: Text(item.mallCategoryName,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: ScreenUtil().setSp(26))),
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
            color: isSelect ? Colors.grey.shade100 : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      ),
    );
  }

  void _getCategory() {
    request('category').then((value) {
      CategoryBigListModel categoryBigListModel =
          CategoryBigListModel.fromJson(value['data']);
      setState(() {
        list = categoryBigListModel.data;
      });
      Provide.value<ChildCategory>(context)
          .setChildCategory(list[0].bxMallSubDto);
    });
  }
}
