import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Colors.white,
      child: Row(
        children: [selectAll(), allPrice(), settleButton()],
      ),
    );
  }

  Widget selectAll() {
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: true, activeColor: Colors.pink, onChanged: (value) {}),
          Text("全选"),
        ],
      ),
    );
  }

  Widget allPrice() {
    return Container(
      width: ScreenUtil().setWidth(430),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerRight,
              width: ScreenUtil().setWidth(430),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "合计：",
                            style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                          ))),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "￥1980",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: ScreenUtil().setSp(36)),
                      )),
                ],
              )),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              "满10元免配送费",
              style: TextStyle(
                  color: Colors.black38, fontSize: ScreenUtil().setSp(20)),
            ),
          )
        ],
      ),
    );
  }

  Widget settleButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      width: ScreenUtil().setWidth(160),
      child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Text(
              "结算",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
