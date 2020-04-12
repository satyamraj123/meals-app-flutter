import 'package:flutter/material.dart';
import 'package:meals_app/meal_item.dart';

import 'meal.dart';
 
class CategoriesMealsScreen extends StatefulWidget {
 static const routeName='categories-meals-screen';
 final List<Meal> availableMeals;
 CategoriesMealsScreen(this.availableMeals);
 
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
String categoryTitle;
List<Meal> categoryMeals;
var _loadedInitData=false;
@override
  void initState() {

    super.initState();
  }
  @override
 
  void didChangeDependencies() {
     if(_loadedInitData==false){
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    categoryMeals=widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
     }
    _loadedInitData=true;

    super.didChangeDependencies();
  }

//void removeMeal(String val){
 // print(val);
 // setState(() {
 //categoryMeals.removeWhere((meal)=>meal.id==val); 
  //print(categoryMeals[0].id); 
 // });
//}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealId: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              //removeItem:removeMeal,
              );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
