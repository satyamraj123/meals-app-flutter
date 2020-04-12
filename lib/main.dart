import 'package:flutter/material.dart';
import 'package:meals_app/categories_meals_screen.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/meal_detail_screen.dart';

import 'tabs_screen.dart';
import 'meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favouratedMeals=[];
  void setfilters(Map<String, bool> _filterdata){
setState(() {
  _filters=_filterdata;

  _availableMeals=DUMMY_MEALS.where((meal) {
    if(_filters['gluten'] && !meal.isGlutenFree)
    {return false;}
 
    if(_filters['lactose'] && !meal.isLactoseFree){
    return false;}
    
    if(_filters['vegan'] && !meal.isVegan){
    return false;}

    if(_filters['vegetarian'] && !meal.isVegetarian){
    return false;}

    return true;

  

  }).toList();
});
  }
void toggleFavourite(String mealId){
  final existingIndex=_favouratedMeals.indexWhere((meal)=>meal.id==mealId);
  if(existingIndex>=0){
    setState(() {
      _favouratedMeals.removeAt(existingIndex);
    });
  }
  else{
    setState(() {
      _favouratedMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId));
    });
  }
}
bool isMealFavourite(String mealId){
  return _favouratedMeals.any((meal)=>meal.id==mealId);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
     // home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouratedMeals),
        CategoriesMealsScreen.routeName: (ctx) => CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavourite,isMealFavourite),
        FiltersScreen.routeName:(ctx)=>FiltersScreen(setfilters,_filters),
      },
    );
  }
}


