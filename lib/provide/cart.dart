import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";

  List<CartInfoModel> cartList = [];
  save(goodsId, goodsName, count, price, images) async {
    //先获取到list数据
    await _getSpInfo();
    bool has = false;
    cartList.forEach((element) {
      if (element.goodsId == goodsId) {
        element.count++;
        has = true;
      }
    });
    if (!has) {
      Map<String, dynamic> map = {
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images,
      };
      cartList.add(CartInfoModel.fromJson(map));
    }
    await _commit();
    //先获取到list数据
    notifyListeners();
  }

  //删除品项
  delete(String goodsId) async {
    //先获取到list数据
    await _getSpInfo();
    int tempId = 0;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].goodsId == goodsId) {
        tempId = i;
        break;
      }
    }
    cartList.removeAt(tempId);
    await _commit();
    await getCartInfo();
  }

  remove() async {
    cartList.clear();
    await _commit();
    notifyListeners();
  }

  //将数据同步到sp
  _commit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = json.encode(cartList).toString();
    print(cartString);
    sp.setString("cartInfo", cartString);
  }

  getCartInfo() async {
    await _getSpInfo();
    notifyListeners();
  }

  _getSpInfo() async {
    print("获取购物车数据");
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = sp.getString("cartInfo");
    cartList.clear();
    if (cartString != null) {
      cartList.clear();
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((element) {
        cartList.add(CartInfoModel.fromJson(element));
      });
    }
  }
}
