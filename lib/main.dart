import 'package:flutter/material.dart';
import 'package:flutter_shop/app_component.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/category_goods_big_id.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var goodProvide = CategoryGoodsListProvide();
  var providers = Providers();
  var goodsList = CategoryGoodsListCategoryIdProvide();
  var detailinfoProvider = DetailsInfoProvide();
  var cartProvide = CartProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(goodProvide))
    ..provide(Provider<CategoryGoodsListCategoryIdProvide>.value(goodsList))
    ..provide(Provider<DetailsInfoProvide>.value(detailinfoProvider))
    ..provide(Provider<CartProvide>.value(cartProvide));
  runApp(ProviderNode(
    child: AppComponent(),
    providers: providers,
  ));
}
