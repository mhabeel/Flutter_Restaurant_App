import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(id: e.id, title: e.title, color: e.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //the width of the tile
        childAspectRatio: 3 / 2, // the ratio of width according to hight
        crossAxisSpacing: 10, // the space between tiles horizantly
        mainAxisSpacing: 10, // the space between tiles verticaly
      ),
    );
  }
}
