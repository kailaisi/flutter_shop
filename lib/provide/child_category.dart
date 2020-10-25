import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childList = [];
  //大类id
  String category = "4";
  //小类ID
  String subCateogryId = "";
  //小类高亮索引
  int index = 0;
  //加载的页数
  int page = 0;
  //是否有更多数据
  bool hasMore = true;
  setChildCategory(List<BxMallSubDto> list, String id) {
    childList.clear();
    index = 0;
    page = 1;
    hasMore = true;
    category = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "00";
    all.mallSubName = "全部";
    all.mallCategoryId = "00";
    all.comments = "null";
    childList.add(all);
    childList.addAll(list);
    notifyListeners();
  }

  addPage() {
    page++;
  }

  changeHasMore(bool has) {
    hasMore = has;
    notifyListeners();
  }

  setChild(int select, String id) {
    index = select;
    subCateogryId = id;
    page = 1;
    hasMore = true;
    notifyListeners();
  }
}
