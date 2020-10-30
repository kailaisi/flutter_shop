import 'package:flutter/material.dart';
import 'package:flutter_shop/model/card_info.dart';
import 'package:flutter_shop/page/cart_page/cart_bottom.dart';
import 'package:flutter_shop/page/cart_page/cart_item.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

//购物车
class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List<CartInfoModel> cartList =
              Provide.value<CartProvide>(context).cartList;
          if (snapshot.hasData && cartList != null) {
            return Stack(children: [
              Provide<CartProvide>(
                builder: (context, child, value) {
                  cartList = value.cartList;
                  return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = cartList[index];
                        return CartItem(item);
                      });
                },
              ),
              Positioned(bottom: 0, left: 0, child: CartBottom())
            ]);
          } else {
            return Text("正在加载....");
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return "end";
  }
}
