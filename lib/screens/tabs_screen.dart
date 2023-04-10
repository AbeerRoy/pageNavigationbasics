import 'package:flutter/foundation.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import './categories_screen.dart';
import 'package:flutter/material.dart';
import 'Favourites_Screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  // final Function saveFiltars;

  // TabsScreen({required this.saveFiltars});

  final List<Meal> favouriteMeals;

  TabsScreen({required this.favouriteMeals});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Map<String, bool> _filters = {
  //   'gluten': false,
  //   'lactose': false,
  //   'vegan': false,
  //   'vegetarian': false,
  // };

  // List<Meal> _availableMeals = DUMMY_MEALS;

//method used to create a 'finalize filter button'
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
    final appBar = AppBar(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      title: const Text(
        'Categories',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white38,
          fontSize: 18,
        ),
      ),
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
    );
    // Using DefaultTabController instead of setState()
    // can Uncomment to have a bottom bar
    final bottomAppBar = Container(
      // padding: EdgeInsets.only(top: 10, bottom: 10),
      color: Theme.of(context).colorScheme.inverseSurface,
      width: double.infinity,
      height: appBar.preferredSize.height + 10,
      child: TabBar(
        unselectedLabelColor: Colors.white12,
        dividerColor: Theme.of(context).colorScheme.inverseSurface,
        indicatorColor: Colors.white60,
        splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
        labelStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Theme.of(context).primaryColor,
        ),
        labelColor: Theme.of(context).primaryColor,
        tabs: const [
          Tab(
            icon: Icon(
              Icons.category,
            ),
            text: 'All Categories',
          ),
          Tab(
            // height: double.min
            icon: Icon(
              Icons.favorite_sharp,
            ),
            text: 'Favourites',
          ),
        ],
      ),
    );

    // Without using setState()
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar,
          endDrawer: MainDrawer(saveFiltars: () {}),
          bottomNavigationBar: bottomAppBar,
          body: TabBarView(children: [
            CategoriesScreen(),
            FavouritesScreen(favouriteMeals: widget.favouriteMeals),
          ]),
        ));
  }
}

// Using setState and 
// final List<Widget> _pages = [
    //   CategoriesScreen(),
    //   FavouritesScreen(),
    // ];
    // int _selectedPageIndex = 0;

    // void _selectPage(int index) {
    //   setState(() {
    //     _selectedPageIndex = index;
    //   });
    // }

// Using SetState
//     return Scaffold(
//       appBar: appBar,
//       body: _pages[_selectedPageIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: _selectPage,
//           backgroundColor: Theme.of(context).colorScheme.inverseSurface,
//           // currentIndex: _selectedPageIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.category),
//               label: 'Categories',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.star),
//               label: 'Favourites',
//             ),
//           ]),
//     );
//   }
// }
