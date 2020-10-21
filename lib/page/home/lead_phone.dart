import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class LeadPhone extends StatelessWidget {
  final String url;
  final String phone;
  _launchURL() async {
    String path = "tel:" + phone;
    if (await canLaunch(path)) {
      await launch(path);
    } else {
      throw Exception("无法调起");
    }
  }

  const LeadPhone({Key key, this.url, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        _launchURL();
      },
      child: Image.network(
        url,
        height: ScreenUtil().setHeight(200),
      ),
    ));
  }
}
