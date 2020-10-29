import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";

  List<CartInfoModel> cartList = [];
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = sp.getString("cartInfo");
    print(cartString);
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    print(temp);
    List<Map> tempList = (temp as List).cast();
    bool has = false;
    int index = 0;
    tempList.forEach((element) {
      if (element["goodsId"] == goodsId) {
        element["count"] = element["count"] + 1;
        cartList[index].count++;
        has = true;
      }
      index++;
    });
    if (!has) {
      Map<String, dynamic> map = {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images,
      };
      tempList.add(map);
      cartList.add(CartInfoModel.fromJson(map));
    }
    cartString = json.encode(tempList).toString();
    print(cartString);
    sp.setString("cartInfo", cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("cartInfo");
    cartList = [];
    print("清空购物车");
    notifyListeners();
  }

  getCartInfo() async {
    print("获取购物车数据");
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = sp.getString("cartInfo");
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((element) {
        cartList.add(CartInfoModel.fromJson(element));
      });
      notifyListeners();
    }
  }
}
