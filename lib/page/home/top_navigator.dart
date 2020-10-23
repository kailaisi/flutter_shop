import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigator extends StatefulWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  _TopNavigatorState createState() => _TopNavigatorState(list: navigatorList);
}

class _TopNavigatorState extends State<TopNavigator> {
  final List list;
  _TopNavigatorState({this.list});

  Widget _gridItem(BuildContext context, item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.network(
            item["image"],
            fit: BoxFit.cover,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item["mallCategoryName"])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (list.length > 10) {
      list.removeRange(10, list.length);
    }
    return Container(
        height: ScreenUtil().setHeight(320),
        padding: EdgeInsets.all(3.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _gridItem(context, list[index]);
            }));
  }
}
