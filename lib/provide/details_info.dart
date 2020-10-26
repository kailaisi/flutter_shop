import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/detail_good.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvide extends ChangeNotifier {
  DetailsModel goodsInfo;

  bool isLeft = true;
  //从后台获取商品详情
  getGoodsInfo(String id) async {
    var formData = {'goodId': id};
    request("goodsDetail", formdata: formData).then((value) {
      goodsInfo = DetailsModel.fromJson(value['data']);
      notifyListeners();
    });
  }

  changeLeft(String ch) {
    if (ch == "left") {
      isLeft = true;
    } else {
      isLeft = false;
    }
    notifyListeners();
  }
}
