import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/applicaton.dart';
import 'package:flutter_shop/routers/routes.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDiy extends StatelessWidget {
  final List<Map> list;
  SwiperDiy({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      child: Swiper(
        itemCount: list.length,
        pagination: new SwiperPagination(),
        loop: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Application.router.navigateTo(context,
                  "${Routes.detailsPage}?id=${list[index]['goodsId']}");
            },
            child: Image.network(list[index]['image'], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}
