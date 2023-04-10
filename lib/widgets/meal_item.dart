import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Course course;
  final bool isGlutenPresent;
  final bool isLactosePresent;
  final bool isVegan;
  final bool isVegetarian;

  const MealItem({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    //required this.course,
    required this.affordability,
    required this.isGlutenPresent,
    required this.isLactosePresent,
    required this.isVegan,
    required this.isVegetarian,
  });

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
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Expensive:
        return 'Expensive';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Reasonable:
        return 'Reasonable';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return MealDetailScreen(
          MealId: id,
          MealTitle: title,
          MealIngredients: ingredients,
          MealSteps: steps,
          MealDuration: duration,
          MealisGlutenPresent: isGlutenPresent,
          MealimageUrl: imageUrl,
          MealisLactosePresent: isLactosePresent,
          MealisVegan: isVegan,
          MealisVegetarian: isVegetarian,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                      width: 250,
                      color: Colors.black54,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text('$duration min')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.bar_chart),
                          SizedBox(
                            width: 6,
                          ),
                          Text(complexityText)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.currency_exchange),
                          SizedBox(
                            width: 6,
                          ),
                          Text(affordabilityText)
                        ],
                      ),
                    ]),
              )
            ],
          )),
    );
  }
}
