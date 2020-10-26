import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

//详情页面顶部的显示区域，包括图片+说明
class DetailTopArea extends StatelessWidget {
  const DetailTopArea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context, child, value) {
        var info = value.goodsInfo;
        if (info != null) {
          var data = info.data.goodInfo;
          if (data != null) {
            return Column(
              children: [
                _goodsImg(data.image1),
                _goodsName(data.goodsName),
                _goodsCode(data.goodsSerialNumber),
                _goodsPrice(data.oriPrice, data.presentPrice)
              ],
            );
          }
        }
        return Container(
          child: Text("正在加载...."),
        );
      },
    );
  }

  //图片地址
  Widget _goodsImg(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  //商品名称
  Widget _goodsName(name) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: ScreenUtil().setWidth(740),
      child: Text(
        name,
      ),
    );
  }

  //商品名称
  Widget _goodsCode(code) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5.0),
      width: ScreenUtil().setWidth(740),
      child: Text(
        "编号：${code}",
        style:
            TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.black26),
      ),
    );
  }

  //商品价格
  Widget _goodsPrice(price, presentPrice) {
    return Container(
        padding: EdgeInsets.only(left: 20, top: 5.0),
        width: ScreenUtil().setWidth(740),
        child: Row(
          children: [
            Text(
              "￥${price}",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Colors.red),
            ),
            Text(
              "市场价：￥${presentPrice}",
              style: TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough),
            )
          ],
        ));
  }
}
