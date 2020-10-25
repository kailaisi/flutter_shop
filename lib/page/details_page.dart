import 'package:flutter/material.dart';

//商品详情
class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("商品ID:${goodsId}"),
      ),
    );
  }
}
