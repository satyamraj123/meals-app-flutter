import 'package:flutter/material.dart';
import 'package:meals_app/favorites_screen.dart';
import 'package:meals_app/main_drawer.dart';
import 'categories_screen.dart';
import 'meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  void initState(){
   _pages = [
    {'title': 'Quick Meals', 'page': CategoriesScreen()},
    {'title': 'Your Favourites', 'page': FavoritesScreen(widget.favouriteMeals)}
  ];
super.initState();
  }
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amber,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.category),
                title: Text('Categories')),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.star),
                title: Text(
                  'Favourites',
                ))
          ]),
    );
  }
}
