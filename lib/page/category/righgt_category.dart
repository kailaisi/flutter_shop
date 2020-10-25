import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/categprg_good.dart';
import 'package:flutter_shop/provide/category_goods_big_id.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

//分类顶部的类别信息
class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List rightList = [];
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(builder: (context, child, list) {
      rightList = list.childList;
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
            return _rightInkWell(index);
          },
        ),
      );
    });
  }

  Widget _rightInkWell(index) {
    BxMallSubDto item = rightList[index];
    bool isSelect = false;
    isSelect = (index == Provide.value<ChildCategory>(context).index);
    return InkWell(
      onTap: () {
        setState(() {
          Provide.value<ChildCategory>(context).setChild(index, item.mallSubId);
          _getGoodsList(subId: item.mallSubId);
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          item.mallSubName,
          style: TextStyle(
            color: isSelect ? Colors.red : Colors.black54,
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }

  void _getGoodsList({String subId}) {
    var form = {
      'categoryId': Provide.value<ChildCategory>(context).category,
      'categorySubId': subId,
      'page': 0
    };
    request('mallGoods', formdata: form).then((value) {
      print(value.toString());
      //刷新分类右部的数据
      CategoryGoodsListModel list =
          CategoryGoodsListModel.fromJson(value['data']);
      Provide.value<CategoryGoodsListProvide>(context).setGoodsList(list.data);
    });
  }
}
