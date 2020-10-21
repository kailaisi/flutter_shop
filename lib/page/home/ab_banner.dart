import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdBanner extends StatelessWidget {
  final String url;
  const AdBanner({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
      this.url,
      height: ScreenUtil().setHeight(20),
    ));
  }
}
