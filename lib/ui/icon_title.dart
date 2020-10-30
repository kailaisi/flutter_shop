import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//左侧图标+文字+箭头样式
class IconTitleView extends StatelessWidget {
  final IconData icon = Icons.ac_unit_sharp;
  final String name;
  final Function ontap = null;
  IconTitleView({icon, this.name, ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
        ),
        child: InkWell(
          onTap: ontap,
          child: ListTile(
            leading: Icon(
              icon,
              size: 25,
            ),
            title: Container(
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.black87, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
            trailing: Icon(Icons.arrow_right),
          ),
        ));
  }
}
