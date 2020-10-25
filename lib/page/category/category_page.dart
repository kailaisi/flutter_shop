import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/categprg_good.dart';
import 'package:flutter_shop/provide/category_goods_big_id.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/ui/loading_footer.dart';
import 'package:provide/provide.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//商品列表
class CategoryGood extends StatefulWidget {
  CategoryGood({Key key}) : super(key: key);

  @override
  _CategoryGoodState createState() => _CategoryGoodState();
}

class _CategoryGoodState extends State<CategoryGood> {
  var _page = 0;
  List<CategoryGoodsModel> good_list = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(builder: (context, child, data) {
      good_list = data.goodList;
      try {
        if (Provide.value<ChildCategory>(context).page == 1) {
          //滚动到0的位置
          _controller.jumpTo(0);
        }
      } catch (e) {}
      if (good_list.isNotEmpty) {
        return Expanded(
            child: Container(
          width: ScreenUtil().setWidth(520),
          child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: _getGoodsList,
              onRefresh: _refresh,
              footer: LoadingFoot(),
              child: ListView.builder(
                  itemCount: good_list.length,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return _goodsItem(index);
                  })),
        ));
      } else {
        return Container(
          child: Text("没有任何数据"),
        );
      }
    });
  }

  Widget _goodsItem(index) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Row(
            children: [
              _goodsImage(index),
              Column(
                children: [_goodsName(index), _goodsPrice(index)],
              )
            ],
          )),
    );
  }

  Widget _goodsImage(index) {
    return Container(
      child: Image.network(
        good_list[index].image,
        width: ScreenUtil().setWidth(150),
      ),
    );
  }

  Widget _goodsName(index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(350),
      child: Text(
        good_list[index].goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(index) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(5.0),
        width: ScreenUtil().setWidth(350),
        child: Row(
          children: [
            Text(
              "价格：${good_list[index].presentPrice}",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Colors.red),
            ),
            Text(
              "价格：${good_list[index].oriPrice}",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setSp(24),
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ));
  }

  void _getGoodsList() {
    var form = {
      'categoryId': Provide.value<ChildCategory>(context).category,
      'categorySubId': Provide.value<ChildCategory>(context).subCateogryId,
      'page': Provide.value<ChildCategory>(context).page,
    };
    request('mallGoods', formdata: form).then((value) {
      print(value.toString());
      if (value['data'] == null || value['data'] == []) {
        Provide.value<ChildCategory>(context).changeHasMore(false);
      } else {
        CategoryGoodsListModel list =
            CategoryGoodsListModel.fromJson(value['data']);
        setState(() {
          good_list.addAll(list.data);
        });
        Provide.value<ChildCategory>(context).page++;
        Provide.value<ChildCategory>(context).changeHasMore(true);
      }
      _refreshController.loadComplete();
      _refreshController.refreshCompleted();
    });
  }

  void _refresh() {
    Provide.value<ChildCategory>(context).page = 1;
    good_list.clear();
    _getGoodsList();
  }
}
