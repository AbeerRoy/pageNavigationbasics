import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatefulWidget {
  final Function saveFiltars;

  MainDrawer({required this.saveFiltars});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  var _glutenFree = false;

  var _vegetarian = false;

  var _vegan = false;

  var _lactoseFree = false;

  // Map<String, bool> _filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  // };
  // // List<Category> _availablecatagory = DUMMY_CATEGORIES;

  // List<Meal> _availableMeals = DUMMY_MEALS;

  // // MainDrawer({required this.saveFiltars});
  // // //method used to create a 'finalize filter button'
  // void _setFilters(Map<String, bool> filterData) {
  //   setState(() {
  //     _filters = filterData;

  //     _availableMeals = DUMMY_MEALS.where((meal) {
  //       if (_filters['gluten']! && meal.isGlutenPresent) {
  //         return false;
  //       }
  //       if (_filters['lactose']! && meal.isLactosePresent) {
  //         return false;
  //       }
  //       if (_filters['vegan']! && !meal.isVegan) {
  //         return false;
  //       }
  //       if (_filters['vegetarian']! && !meal.isVegetarian) {
  //         return false;
  //       }
  //       return true;
  //     }).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget ListTileBuilder(String text, IconData iconname, String tapHandler) {
      return ListTile(
          leading: Icon(iconname),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            // pushReplacementNamed replaces the page instead of forming a stack of page
            Navigator.of(context).pushNamed(tapHandler);
          });
    }

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Recipies',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white38,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface,
              // border: Border.all(width: double.infinity)),
            ),
          ),
          ListTileBuilder('Meal', Icons.fastfood_rounded, '/'),
          ListTileBuilder('Settings', Icons.settings, FiltersScreen.routeName),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: const Text('Adjust your Meal Selection',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
              ),
              SwitchListTile(
                value: _glutenFree,
                title: const Text('Gluten-Free',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text('Only include gluten-free meals',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    )),
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                value: _lactoseFree,
                title: const Text('Lactose-free',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text('Only include Lactose-free meals',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    )),
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              SwitchListTile(
                value: _vegan,
                title: const Text('Vegan',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text('Only include Vegan meals',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    )),
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
              SwitchListTile(
                value: _vegetarian,
                title: const Text('Vegetarian',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text('Only include Vegetarian meals',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    )),
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // final selectedFilter = {
                        //   'gluten': _glutenFree,
                        //   'lactose': _lactoseFree,
                        //   'vegan': _vegan,
                        //   'vegetarian': _vegetarian,
                        // };
                        // widget.saveFiltars(selectedFilter);

                        //   Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (_) {
                        //       return CategoryMealsScreen(
                        //           MealId:id , availableMeals: _availableMeals);
                        //     }),
                        //   );
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
