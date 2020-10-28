import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

//底部加入购物车
class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(720),
        color: Colors.white,
        height: ScreenUtil().setHeight(80),
        child: Row(children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: ScreenUtil().setWidth(120),
              child: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Provide.value<CartProvide>(context).save()
              },
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(300),
                color: Colors.green,
                child: Text(
                  "加入购物车",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              )),
          InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(300),
                color: Colors.red,
                child: Text(
                  "立即购买",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(28)),
                ),
              )),
        ]));
  }
}
