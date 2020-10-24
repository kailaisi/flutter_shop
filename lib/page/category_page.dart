import 'package:flutter/material.dart';
import 'package:flutter_shop/page/category/category_page.dart';
import 'package:flutter_shop/page/category/righgt_category.dart';

import 'category/category_nav.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: [
                RightCategoryNav(),
                CategoryGood(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
