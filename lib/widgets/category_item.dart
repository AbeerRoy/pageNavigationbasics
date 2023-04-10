import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem({
    required this.id,
    required this.title,
    required this.color,
  });

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoryMealsScreen(
    //       categoryId: id,
    //       categoryTitle: title,
    //     );
    //   }),
    // );
    //An alternative is 'named route'
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 15,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ),
    );
  }
}
