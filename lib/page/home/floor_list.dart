import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [_firstRow(), _otherRow()],
      ),
    );
  }

  Widget _firstRow() {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            _goodItem(floorGoodsList[0]),
            Column(
              children: [
                _goodItem(floorGoodsList[1]),
                _goodItem(floorGoodsList[2]),
              ],
            )
          ],
        ));
  }

  Widget _otherRow() {
    return Row(
      children: [
        _goodItem(floorGoodsList[3]),
        _goodItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodItem(item) {
    return Container(
      width: ScreenUtil().setWidth(360),
      child: InkWell(
        onTap: () {
          print("${item['goodsId']}");
        },
        child: Image.network(
          item['image'],
        ),
      ),
    );
  }
}
