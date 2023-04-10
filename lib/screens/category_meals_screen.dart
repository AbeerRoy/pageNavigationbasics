import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //     {required this.categoryId, required this.categoryTitle});
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen({
    required this.availableMeals,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'].toString();
    final categoryTitle = routeArgs['title'].toString();
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          categoryTitle,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              categories: categoryMeals[index].categories,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              // ingredients: categoryMeals[index].ingredients,
              // steps: categoryMeals[index].steps,
              // isGlutenPresent: categoryMeals[index].isGlutenPresent,
              // isLactosePresent: categoryMeals[index].isLactosePresent,
              // isVegan: categoryMeals[index].isVegan,
              // isVegetarian: categoryMeals[index].isVegetarian,
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
