import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/routers/applicaton.dart';
import 'package:flutter_shop/routers/routes.dart';

class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_firstRow(context), _otherRow(context)],
      ),
    );
  }

  Widget _firstRow(context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            _goodItem(context, floorGoodsList[0]),
            Column(
              children: [
                _goodItem(context, floorGoodsList[1]),
                _goodItem(context, floorGoodsList[2]),
              ],
            )
          ],
        ));
  }

  Widget _otherRow(context) {
    return Row(
      children: [
        _goodItem(context, floorGoodsList[3]),
        _goodItem(context, floorGoodsList[4]),
      ],
    );
  }

  Widget _goodItem(context, item) {
    return Container(
      width: ScreenUtil().setWidth(360),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(
              context, "${Routes.detailsPage}?id=${item['goodsId']}");
        },
        child: Image.network(
          item['image'],
        ),
      ),
    );
  }
}
