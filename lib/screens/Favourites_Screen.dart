import 'package:check_recipe/models/meal.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen({required this.favouriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourite yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            categories: favouriteMeals[index].categories,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            // ingredients: favouriteMeals[index].ingredients,
            // steps: favouriteMeals[index].steps,
            // isGlutenPresent: favouriteMeals[index].isGlutenPresent,
            // isLactosePresent: favouriteMeals[index].isLactosePresent,
            // isVegan: favouriteMeals[index].isVegan,
            // isVegetarian: favouriteMeals[index].isVegetarian,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
