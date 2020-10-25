import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/categprg_good.dart';

//分类页面的右侧的商品信息
class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsModel> goodList = [];

  //点击大类的时候更新商品列表
  setGoodsList(
    List<CategoryGoodsModel> list,
  ) {
    if (list == null) {
      goodList = [];
    } else {
      goodList = list;
    }
    notifyListeners();
  }
}
