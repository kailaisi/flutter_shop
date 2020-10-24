import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childList = [];
  setChildCategory(List<BxMallSubDto> list) {
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "00";
    all.mallSubName = "全部";
    all.mallCategoryId = "00";
    all.comments = "null";
    childList.add(all);
    childList.addAll(list);
    notifyListeners();
  }
}
