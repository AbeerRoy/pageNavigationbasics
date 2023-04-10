// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

// enum Course {
//   Breakfast,
//   Lunch,
//   Dinner,
//   Special,
//   Snacks,
// }

enum Affordability {
  Affordable,
  Reasonable,
  Pricey,
  Luxurious,
  SpecialOccasion,
  Expensive,
}

class Meal {
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

  const Meal({
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
}
