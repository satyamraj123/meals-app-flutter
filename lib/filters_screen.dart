import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';


class FiltersScreen extends StatefulWidget {
  final Function savefilters;
  static const routeName='filters-screen';
  final Map<String,bool> currentfilters;
  FiltersScreen(this.savefilters,this.currentfilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;
  @override
  initState(){
_glutenfree=widget.currentfilters['gluten'];
_lactosefree=widget.currentfilters['lactose'];
_vegan=widget.currentfilters['vegan'];
_vegetarian=widget.currentfilters['vegetarian'];
super.initState();
  }
  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(
                      title: Text(title),
                      value: currentValue,
                      subtitle: Text(description),
                      onChanged:updateValue,
                      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed:() {
               Map<String, bool> _selectedfilters = {
    'gluten': _glutenfree,
    'vegetarian': _vegetarian,
    'vegan': _vegan,
    'lactose': _lactosefree,
  };
              widget.savefilters(_selectedfilters);})
          ],
        ),
        drawer: MainDrawer(),

        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                   _buildSwitchListTile('Gluten Free','Only Include Gluten Free Meals',_glutenfree,(newValue){setState(() {
                     _glutenfree=newValue;
                   });}),
                    _buildSwitchListTile('Lactose Free','Only Include Lactose Free Meals',_lactosefree,(newValue){setState(() {
                     _lactosefree=newValue;
                   });}),
                     _buildSwitchListTile('Vegetarian','Only Include Vegetarian Meals',_vegetarian,(newValue){setState(() {
                     _vegetarian=newValue;
                   });}),
                   _buildSwitchListTile('Vegan','Only Include Vegan Meals',_vegan,(newValue){setState(() {
                     _vegan=newValue;
                   });}),

                ],
              ),
            )
          ],
        ));
  } }