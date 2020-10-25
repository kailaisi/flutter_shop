import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category.dart';
import 'package:flutter_shop/model/categprg_good.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
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
            .setChildCategory(item.bxMallSubDto, item.mallCategoryId);
        _getGoodsList(categoryId: item.mallCategoryId);
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

// 获取做的的分类信息
  void _getCategory() {
    request('category').then((value) {
      CategoryBigListModel categoryBigListModel =
          CategoryBigListModel.fromJson(value['data']);
      setState(() {
        list = categoryBigListModel.data;
      });
      // 修改分类右侧顶部的小类信息
      Provide.value<ChildCategory>(context)
          .setChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
      //刚进入页面的时候，要加载第一个数据的全部信息
      _getGoodsList(categoryId: list[0].mallCategoryId);
    });
  }

  void _getGoodsList({String categoryId}) {
    var form = {'categoryId': categoryId, 'page': 0, 'categorySubId': ""};
    request('mallGoods', formdata: form).then((value) {
      print(value.toString());
      //刷新分类右部的数据
      CategoryGoodsListModel list =
          CategoryGoodsListModel.fromJson(value['data']);
      Provide.value<CategoryGoodsListProvide>(context).setGoodsList(list.data);
    });
  }
}
