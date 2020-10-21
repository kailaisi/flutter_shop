import 'package:flutter/material.dart';

//楼层表头
class FloorTitle extends StatelessWidget {
  final Map url;
  const FloorTitle({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Image.network(url['PICTURE_ADDRESS'], fit: BoxFit.cover),
    );
  }
}
