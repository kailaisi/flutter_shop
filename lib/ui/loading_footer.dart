import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LoadingFoot extends StatelessWidget {
  const LoadingFoot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      builder: (context, LoadStatus mode) {
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text("上拉加载");
        } else if (mode == LoadStatus.loading) {
          body = Text("正在加载....请稍候");
        } else if (mode == LoadStatus.failed) {
          body = Text("加载失败！点击重试！");
        } else if (mode == LoadStatus.canLoading) {
          body = Text("松手,加载更多!");
        } else {
          body = Text("没有更多数据了!");
        }
        return Container(
          height: 55.0,
          color: Colors.grey.shade400,
          child: Center(child: body),
        );
      },
    );
  }
}
