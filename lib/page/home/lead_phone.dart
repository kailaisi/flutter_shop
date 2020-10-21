import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeadPhone extends StatelessWidget {
  final String url;
  final String phone;
  const LeadPhone({Key key, this.url, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {},
      child: Image.network(
        url,
        height: ScreenUtil().setHeight(200),
      ),
    ));
  }
}
