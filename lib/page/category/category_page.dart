import 'package:flutter/material.dart';
import 'package:flutter_shop/model/categprg_good.dart';
import 'package:flutter_shop/service/service_method.dart';

//商品列表
class CategoryGood extends StatefulWidget {
  CategoryGood({Key key}) : super(key: key);

  @override
  _CategoryGoodState createState() => _CategoryGoodState();
}

class _CategoryGoodState extends State<CategoryGood> {
  var _page = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("列表信息"),
    );
  }

  @override
  void initState() {
    _getGoodsList();
    super.initState();
  }

  void _getGoodsList() {
    var form = {'categoryId': 12, 'page': _page};
    request('mallGoods', formdata: form).then((value) {
      // CategoryGoodsListModel list =
      //     CategoryGoodsListModel.fromJson(value['data']);
      // list.data.forEach((element) {
      //   print(element.goodsName);
      // });
      // _page++;
    });
  }
}
