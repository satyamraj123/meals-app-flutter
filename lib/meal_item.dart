import 'package:flutter/material.dart';
import 'meal_detail_screen.dart';
import 'meal.dart';


class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;
  MealItem(
      {@required
      this.mealId,
     @required this.title,
     @required this.imageUrl,
      @required this.duration,
     @required this.complexity,
     @required this.affordability,
     //@required this.removeItem
     }
     );
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }
 void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments: mealId);
    //.then((onValue){
      //if(onValue!=null){
        //removeItem(onValue);
      }
    
  @override
  Widget build(BuildContext context) {
    return InkWell(splashColor: Theme.of(context).primaryColor,
      onTap:() =>selectMeal(context),
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: 380,
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ]),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.schedule),
                      Text(duration.toString() + 'min'),
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.work),
                      Text(complexityText),
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(affordabilityText),
                    ])
                  ],
                ))
          ],
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        )
        )
        ;
        }
      
    
  
}
