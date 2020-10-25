import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/page/details_page.dart';

Handler detailsHandlers = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsId = params['id'].first;
  print("商品id:$goodsId");
  return DetailPage(goodsId);
});
