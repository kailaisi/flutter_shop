import 'package:flutter/material.dart';
import 'package:flutter_shop/app_component.dart';
import 'package:flutter_shop/page/index_page.dart';
import 'package:flutter_shop/provide/category_goods_big_id.dart';
import 'package:flutter_shop/provide/category_goods_list.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/provide/counter.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:flutter_shop/routers/applicaton.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';

import 'routers/routes.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var goodProvide = CategoryGoodsListProvide();
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(goodProvide))
    ..provide(Provider<CategoryGoodsListCategoryIdProvide>.value(
        CategoryGoodsListCategoryIdProvide()))
    ..provide(Provider<DetailsInfoProvide>.value(DetailsInfoProvide()));
  runApp(ProviderNode(
    child: AppComponent(),
    providers: providers,
  ));
}
