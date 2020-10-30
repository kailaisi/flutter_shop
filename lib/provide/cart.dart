import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";
  double allGoodsPrice = 0.0;
  int allGoodsCount = 0;
  List<CartInfoModel> cartList = [];
  //是否全选
  bool isAllCheck = false;

  save(goodsId, goodsName, count, price, images) async {
    //先获取到list数据
    await _getSpInfo();
    bool has = false;
    cartList.forEach((element) {
      if (element.goodsId == goodsId) {
        element.count++;
        element.isSelect = true;
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
        "isSelect": true
      };
      cartList.add(CartInfoModel.fromJson(map));
    }
    await _commit();
    //先获取到list数据
    await getCartInfo();
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

  //修改选中状态
  chagneCheckedState(String goodsId) async {
    //先获取到list数据
    await _getSpInfo();
    int tempId = 0;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].goodsId == goodsId) {
        tempId = i;
        break;
      }
    }
    cartList[tempId].isSelect = !cartList[tempId].isSelect;
    await _commit();
    await getCartInfo();
  }

  //全选
  seleAll(bool isCheck) async {
    //先获取到list数据
    await _getSpInfo();
    isAllCheck = isCheck;
    cartList.forEach((element) {
      element.isSelect = isCheck;
    });
    await _commit();
    await getCartInfo();
  }

  remove() async {
    cartList.clear();
    await _commit();
    await getCartInfo();
  }

  addOrMinus(String goodsId, String oper) async {
    //先获取到list数据
    await _getSpInfo();
    int tempId = 0;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].goodsId == goodsId) {
        tempId = i;
        break;
      }
    }
    var temp = cartList[tempId];
    if (oper == "add") {
      temp.count++;
    } else {
      cartList[tempId].count--;
      if (temp.count == 0) {
        cartList.remove(temp);
      }
    }
    await _commit();
    await getCartInfo();
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
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = sp.getString("cartInfo");
    cartList.clear();
    allGoodsCount = 0;
    allGoodsPrice = 0.0;
    isAllCheck = true;
    if (cartString != null) {
      cartList.clear();
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((element) {
        CartInfoModel item = CartInfoModel.fromJson(element);
        cartList.add(item);
        if (item.isSelect) {
          allGoodsCount += item.count;
          allGoodsPrice += item.price * item.count;
        } else {
          isAllCheck = false;
        }
      });
    }
  }
}
