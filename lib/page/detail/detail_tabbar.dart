import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailTabBar extends StatelessWidget {
  const DetailTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context, child, value) {
        var isLeft = value.isLeft;
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              _tab(context, "详情", () {
                Provide.value<DetailsInfoProvide>(context).changeLeft("left");
              }, isLeft),
              _tab(context, "评价", () {
                Provide.value<DetailsInfoProvide>(context).changeLeft("right");
              }, !isLeft),
            ],
          ),
        );
      },
    );
  }

  Widget _tab(contxt, String tabName, Function ontap, isSelect) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(360),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1, color: isSelect ? Colors.pink : Colors.black12))),
        child: Text(
          tabName,
          style: TextStyle(color: isSelect ? Colors.pink : Colors.black87),
        ),
      ),
    );
  }
}
