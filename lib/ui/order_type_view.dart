import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//订单页面的小控件
class OrderTypeView extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function ontap = null;
  OrderTypeView({this.icon, this.name, ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: InkWell(
          onTap: ontap,
          child: Column(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black87, fontSize: ScreenUtil().setSp(24)),
                ),
              )
            ],
          ),
        ));
  }
}
