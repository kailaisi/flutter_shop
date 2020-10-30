import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

//购物车底部的信息
class CartBottom extends StatelessWidget {
  const CartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context, child, value) {
          return Row(
            children: [
              selectAll(context),
              allPrice(context),
              settleButton(context)
            ],
          );
        },
      ),
    );
  }

  Widget selectAll(context) {
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: isAllCheck,
              activeColor: Colors.pink,
              onChanged: (value) {
                Provide.value<CartProvide>(context).seleAll(value);
              }),
          Text("全选"),
        ],
      ),
    );
  }

  Widget allPrice(context) {
    var price = Provide.value<CartProvide>(context).allGoodsPrice;
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
                        "￥${price}",
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

  Widget settleButton(context) {
    var count = Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: Text(
              "结算(${count})",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
