import 'package:flutter/material.dart';
import 'package:flutter_shop/page/home/floor_list.dart';
import 'package:flutter_shop/page/home/floor_title.dart';
import 'package:flutter_shop/page/home/hot_good.dart';
import 'package:flutter_shop/page/home/lead_phone.dart';
import 'package:flutter_shop/page/home/recomand.dart';
import 'package:flutter_shop/service/service_method.dart';

import 'home/top_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  var homeContentRes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美好人间")),
      body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              var data = snapshop.data;
              List<Map> swipter = (data["data"]["slides"] as List).cast();
              String leaderImg = data["data"]["shopInfo"]["leaderImage"];
              String leaderPhone = data["data"]["shopInfo"]["leaderPhone"];
              List<Map> recommend = (data["data"]["recommend"] as List).cast();
              Map floor1Pic = data["data"]["floor1Pic"];
              List<Map> floor1 = (data["data"]["floor1"] as List).cast();
              Map floor2Pic = data["data"]["floor2Pic"];
              List<Map> floor2 = (data["data"]["floor2"] as List).cast();
              Map floor3Pic = data["data"]["floor3Pic"];
              List<Map> floor3 = (data["data"]["floor3"] as List).cast();
              return SingleChildScrollView(
                  child: Container(
                      child: Column(
                children: [
                  SwiperDiy(list: swipter),
                  LeadPhone(
                    url: leaderImg,
                    phone: leaderPhone,
                  ),
                  Recommend(list: recommend),
                  FloorTitle(url: floor1Pic),
                  FloorContent(
                    floorGoodsList: floor1,
                  ),
                  FloorTitle(url: floor2Pic),
                  FloorContent(
                    floorGoodsList: floor2,
                  ),
                  FloorTitle(url: floor3Pic),
                  FloorContent(
                    floorGoodsList: floor3,
                  ),
                  HotGoods()
                ],
              )));
            } else {
              return Center();
            }
          }),
    );
  }
}
