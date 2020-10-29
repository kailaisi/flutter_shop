import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

//底部加入购物车
class DetailBottom extends StatelessWidget {
  const DetailBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goddsName = goodsInfo.goodsName;
    var price = goodsInfo.presentPrice;
    var image = goodsInfo.image1;
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
              onTap: () async {
                await Provide.value<CartProvide>(context)
                    .save(goodsId, goddsName, 1, price, image);
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
              onTap: () async {
                await Provide.value<CartProvide>(context).remove();
              },
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
