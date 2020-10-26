import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//说明页面
class DetailExplain extends StatelessWidget {
  const DetailExplain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(10),
      child: Text(
        "说明：> 极速送达 > 正品保证",
        style: TextStyle(
            color: Colors.red.shade400, fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }
}
