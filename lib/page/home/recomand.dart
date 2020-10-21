import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//推荐页面
class Recommend extends StatelessWidget {
  final List list;

  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(30),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
      child: Text(
        "商品推荐",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.red.shade500),
      ),
    );
  }

  Widget _item(item) {
    return InkWell(
        onTap: () {},
        child: Container(
            height: ScreenUtil().setHeight(330),
            width: ScreenUtil().setWidth(240),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
            ),
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                )),
                Text("￥${item['mallPrice']}"),
                Text(
                  "￥${item['price']}",
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            )));
  }

//推荐列表
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.all(10),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: list.map((e) {
            return _item(e);
          }).toList()),
    );
  }

  const Recommend({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [_title(), _recommendList()],
        ));
  }
}
