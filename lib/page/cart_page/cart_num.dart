import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCount extends StatelessWidget {
  const CartCount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: [_subBtn(), _countNum(), _addBtn()],
      ),
    );
  }

  Widget _subBtn() {
    return InkWell(
        onTap: () {},
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
          child: Text("5"),
        ));
  }

  Widget _addBtn() {
    return InkWell(
        onTap: () {},
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
