import 'package:flutter/material.dart';
import 'filters_screen.dart';


class MainDrawer extends StatelessWidget {

  void _tapHandler1(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
      
    
  }
    void _tapHandler2(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                "CookingUp",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor),
              )),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.title,
            ),
            onTap:()=> _tapHandler1(context),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.title,
            ),
            onTap: ()=> _tapHandler2(context),
          )
        ],
      ),
    );
  }
}
