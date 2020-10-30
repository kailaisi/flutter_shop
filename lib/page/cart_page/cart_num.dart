import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  CartInfoModel item;
  CartCount(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: [_subBtn(context), _countNum(), _addBtn(context)],
      ),
    );
  }

  Widget _subBtn(context) {
    return InkWell(
        onTap: () {
          Provide.value<CartProvide>(context).addOrMinus(item.goodsId, "min");
        },
        child: Container(
          width: ScreenUtil().setWidth(45),
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black12))),
          child: Text("-"),
        ));
  }

  Widget _countNum() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: ScreenUtil().setWidth(70),
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,
          child: Text("${item.count}"),
        ));
  }

  Widget _addBtn(context) {
    return InkWell(
        onTap: () {
          Provide.value<CartProvide>(context).addOrMinus(item.goodsId, "add");
        },
        child: Container(
          width: ScreenUtil().setWidth(45),
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(left: BorderSide(color: Colors.black12))),
          child: Text("+"),
        ));
  }
}
