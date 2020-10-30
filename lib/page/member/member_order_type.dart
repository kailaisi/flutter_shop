import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/ui/order_type_view.dart';

class MemberOrderType extends StatelessWidget {
  const MemberOrderType({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(720),
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: OrderTypeView(icon: Icons.party_mode, name: "待付款"),
          ),
          Expanded(
            child: OrderTypeView(icon: Icons.query_builder, name: "待发货"),
          ),
          Expanded(
            child: OrderTypeView(icon: Icons.car_rental, name: "待收货"),
          ),
          Expanded(
            child: OrderTypeView(icon: Icons.edit, name: "待评价"),
          ),
        ],
      ),
    );
  }
}
