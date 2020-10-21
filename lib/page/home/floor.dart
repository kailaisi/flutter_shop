import 'package:flutter/material.dart';
import 'package:flutter_shop/page/home/floor_list.dart';
import 'package:flutter_shop/page/home/floor_title.dart';

//
class Floor extends StatelessWidget {
  const Floor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [FloorTitle(), FloorContent()],
      ),
    );
  }
}
