import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailWeb extends StatelessWidget {
  const DetailWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(builder: (context, child, value) {
      var info = value.goodsInfo;
      if (info != null) {
        return Container(
          child: Html(data: info.data.goodInfo.goodsDetail),
        );
      } else {
        return Container();
      }
    });
  }
}
