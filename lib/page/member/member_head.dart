import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//会员页面的表头
class MemberHeader extends StatelessWidget {
  const MemberHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: ScreenUtil().setWidth(720),
      // color: Colors.pink,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2360236717,3337809830&fm=26&gp=0.jpg"),
              fit: BoxFit.cover)),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://user-gold-cdn.xitu.io/2020/6/28/172fa1961f812d84?imageView2/0/w/1280/h/960/format/webp/ignore-error/1"),
            radius: 30,
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "开了肯",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32), color: Colors.black45),
            ))
      ]),
    );
  }
}
