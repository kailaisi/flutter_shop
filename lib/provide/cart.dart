import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  String cartString = "[]";

  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    cartString = sp.getString("cartInfo");
    var temp = cartString == null ? [] : json.decode(cartString);
    List<Map> tempList = (temp as List).toList();
    bool has = false;
    tempList.forEach((element) {
      if (element["goodsId"] == goodsId) {
        element["count"] = element["count"] + 1;
        has = true;
      }
    });
    if (!has) {
      tempList.add({
        "goodsId": goodsId,
        "goodsName": goodsName,
        "count": count,
        "price": price,
        "images": images,
      });
    }
    cartString = json.encode(tempList).toString();
    print(cartString);
    sp.setString("cartInfo", cartString);
    notifyListeners();
  }

  remove() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("cartInfo");
    notifyListeners();
  }
}
