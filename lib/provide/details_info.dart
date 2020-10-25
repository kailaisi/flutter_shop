import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/detail_good.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide extends ChangeNotifier {
  DetailsModel goodsInof = null;

  //从后台获取商品详情
  getGoodsInfo(String id) {
    var formData = {'goodId': id};
    request("goodsDetail", formdata: formData).then((value) {
      goodsInof = DetailsModel.fromJson(value);
      notifyListeners();
    });
  }
}
