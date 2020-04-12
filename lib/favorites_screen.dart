import 'package:flutter/material.dart';
import 'meal.dart';
import 'meal_item.dart';
class FavoritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  FavoritesScreen(this.favouriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favouriteMeals.isEmpty){
    return Center(child: Text('You Have no Favourites Yet!..Start Adding Some.',style: Theme.of(context).textTheme.title,));
    }
    else{
return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealId: widget.favouriteMeals[index].id,
              title: widget.favouriteMeals[index].title,
              imageUrl: widget.favouriteMeals[index].imageUrl,
              duration: widget.favouriteMeals[index].duration,
              complexity: widget.favouriteMeals[index].complexity,
              affordability: widget.favouriteMeals[index].affordability,
              );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
    
  }
}