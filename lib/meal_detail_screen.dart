import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal-details-screen';
  final Function toggleFavourite;
  final Function isMealFavourite;
  MealDetailScreen(this.toggleFavourite, this.isMealFavourite);

  Widget buildText(BuildContext context, text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 180,
      width: 380,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        // actions: <Widget>[
        // IconButton(icon: Icon(isMealFavourite(mealId)?Icons.star:Icons.star_border), onPressed:()=> toggleFavourite(mealId))
        //],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(isMealFavourite(mealId) ? Icons.star : Icons.star_border),
          onPressed: () => toggleFavourite(mealId)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //image,ingredients,steps
            Container(
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildText(context, 'Ingredients required'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Container(
                  height: 35,
                  width: 50,
                  child: Card(
                    elevation: 5,
                    color: Colors.black12,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text((index + 1).toString() +
                          '.  ' +
                          selectedMeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
            ),
            buildText(context, 'Steps To Prepare'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.grey,
                      child: Text((index + 1).toString()),
                    ),
                    Container(
                      width: 300,
                      child: Card(
                        elevation: 5,
                        color: Colors.black12,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            selectedMeal.steps[index],
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
