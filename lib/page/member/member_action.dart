import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/icon_title.dart';

//会员中心的action
class MemberAction extends StatelessWidget {
  const MemberAction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(children: [
        IconTitleView(
          name: "领取优惠券",
        ),
        IconTitleView(
          name: "已领取优惠券",
        ),
        IconTitleView(
          name: "地址管理",
        ),
        IconTitleView(
          name: "客服电话",
        ),
        IconTitleView(
          name: "关于我们",
        ),
      ]),
    );
  }
}
