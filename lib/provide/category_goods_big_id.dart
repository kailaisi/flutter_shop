import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/categprg_good.dart';

//分类页面的右侧的商品信息
class CategoryGoodsListCategoryIdProvide with ChangeNotifier {
  String _categoryId = "0";

  String get categoryId => _categoryId;

  set categoryId(String categoryId) {
    _categoryId = categoryId;
  }
}
