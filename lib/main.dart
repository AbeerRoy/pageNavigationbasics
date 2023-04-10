import './dummy_data.dart';
import './models/meal.dart';
import 'screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/filters_screen.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //creating map to filter from global main.dart
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

// //method used to create a 'finalize filter button'
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && meal.isGlutenPresent) {
          return false;
        }
        if (_filters['lactose']! && meal.isLactosePresent) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealID) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealID);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe-List',
      theme: ThemeData(
        primaryColor: Colors.white38,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: const TextStyle(
                fontSize: 25,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // '/': (context) => CategoriesScreen(),
        '/': (context) => TabsScreen(favouriteMeals: _favouriteMeals),

        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavourite: _toggleFavourite,
              isFavourite: _isMealFavourite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFiltars: _setFilters,
              currentFilters: _filters,
            ),

        // ErrorPageScreen.routeName: (context) => ErrorPageScreen(),
      },
      //a fallback option if the route fails to link
      onGenerateRoute: (settings) {
        print(settings.arguments);
        //we can cross check and give an error page if page route name is generated dynamically and doesn't reach the desired link
        // if(settings.name == '/meal-detail'){
        //   return ...;
        // } else if(settings.name == '/meal-detail'){
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (context) => ErrorPageScreen());
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      //When onGenerateRoute or default routes are not defined then the following can be displayed intead of crashing
      //It can also be a 404 page
      onUnknownRoute: (settings) {
        // return MaterialPageRoute(builder: (context) => ErrorPageScreen());
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
