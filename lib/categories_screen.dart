import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'categories_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(catData.id,catData.title, catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 3 / 1.5,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      
     ) ;
  }
}
