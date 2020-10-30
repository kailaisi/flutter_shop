import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:flutter_shop/page/cart_page/cart_num.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

//购物车一条信息
class CartItem extends StatelessWidget {
  CartInfoModel item;
  CartItem(this.item);

  @override
  Widget build(BuildContext context) {
    print(json.encode(item));
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: [
          _checkedBx(),
          _pic(),
          Expanded(child: _cartGoodsName()),
          _cartGoodsPrice(context)
        ],
      ),
    );
  }

  //选中框
  Widget _checkedBx() {
    return Container(
      child: Checkbox(
        activeColor: Colors.pink,
        value: true,
        onChanged: (val) {},
      ),
    );
  }

  //图片
  Widget _pic() {
    return Container(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.network(item.images),
    );
  }

  //商品名称
  Widget _cartGoodsName() {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(item.goodsName), CartCount()],
      ),
    );
  }

  Widget _cartGoodsPrice(context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      padding: EdgeInsets.all(5),
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Text("${item.price}"),
          Container(
            child: InkWell(
              onTap: () {
                Provide.value<CartProvide>(context).delete(item.goodsId);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
