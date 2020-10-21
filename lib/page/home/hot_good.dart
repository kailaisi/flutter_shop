import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';

class HotGoods extends StatefulWidget {
  HotGoods({Key key}) : super(key: key);

  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  void initState() {
    super.initState();
    print(getHotPageContent().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
