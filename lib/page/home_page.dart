import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/page/home/floor_list.dart';
import 'package:flutter_shop/page/home/floor_title.dart';
import 'package:flutter_shop/page/home/hot_good.dart';
import 'package:flutter_shop/page/home/lead_phone.dart';
import 'package:flutter_shop/page/home/recomand.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/ui/loading_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'home/top_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _page = 1;
  List hotGoos = [];
  @override
  void initState() {
    super.initState();
    _getHotGoods();
  }

  @override
  bool get wantKeepAlive => true;
  var homeContentRes;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美好人间")),
      body: FutureBuilder(
          future: request('homePageContent', formdata: {}),
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
              return SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onLoading: _getHotGoods,
                  footer: LoadingFoot(),
                  child: ListView(
                    children: [
                      SwiperDiy(list: swipter),
                      TopNavigator(),
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
                      hotTitle,
                      _hotList(),
                    ],
                  ));
            } else {
              return Center();
            }
          }),
    );
  }

  void _getHotGoods() async {
    var form = {'page': _page};
    request('homePageBelowConten', formdata: form).then((value) {
      List<Map> newGoods = (value['data'] as List).cast();
      hotGoos.addAll(newGoods);
      _page++;
      setState(() {
        _refreshController.loadComplete();
      });
    });
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text("火爆专区"),
  );

  Widget _hotList() {
    if (hotGoos.isNotEmpty) {
      List list = hotGoos.map((e) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(350),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: [
                Image.network(
                  e['image'],
                  width: ScreenUtil().setWidth(355),
                ),
                Text(
                  e['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: [
                    Text("￥${e['price']}"),
                    Expanded(
                      child: Text(''), // 中间用Expanded控件
                    ),
                    Text(
                      "￥${e['mallPrice']}",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: list,
      );
    } else {
      return Container();
    }
  }
}
