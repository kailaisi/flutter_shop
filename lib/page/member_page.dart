import 'package:flutter/material.dart';
import 'package:flutter_shop/page/member/member_action.dart';
import 'package:flutter_shop/page/member/member_head.dart';
import 'package:flutter_shop/page/member/member_order_title.dart';
import 'package:flutter_shop/page/member/member_order_type.dart';

//会员中心页面
class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: Container(
        child: Column(
          children: [
            MemberHeader(),
            MemberOrderTitle(),
            MemberOrderType(),
            MemberAction()
          ],
        ),
      ),
    );
  }
}
