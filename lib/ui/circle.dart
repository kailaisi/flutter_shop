import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final int high;
  CircleImage(this.url, this.high);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Image.network(url, fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(1),
      height: ScreenUtil().setWidth(high),
      width: ScreenUtil().setWidth(high),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(high) / 2)),
    );
  }
}
