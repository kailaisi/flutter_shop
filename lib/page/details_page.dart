import 'package:flutter/material.dart';
import 'package:flutter_shop/page/detail/detail_bottom.dart';
import 'package:flutter_shop/page/detail/detail_explain.dart';
import 'package:flutter_shop/page/detail/detail_top_area.dart';
import 'package:flutter_shop/page/detail/detail_web.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

import 'detail/detail_tabbar.dart';

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
                return Stack(
                  children: [
                    Container(
                      child: ListView(
                        children: [
                          DetailTopArea(),
                          DetailExplain(),
                          DetailTabBar(),
                          DetailWeb(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: DetailBottom(),
                    )
                  ],
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
