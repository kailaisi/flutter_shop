import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

//商品详情
class DetailPage extends StatelessWidget {
  final String goodsId;
  const DetailPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("商品详情页"),
        ),
        body: FutureBuilder(
            future: _getBackInfo(context),
            builder: (context, snapshop) {
              if (snapshop.hasData) {
                return Container(
                  child: Column(
                    children: [],
                  ),
                );
              } else {
                return Container(
                  child: Text("loading....."),
                );
              }
            }));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return "完成加载";
  }
}
