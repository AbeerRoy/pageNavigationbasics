import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  final String MealId;
  final String MealTitle;
  final String MealimageUrl;
  final List<String> MealIngredients;
  final List<String> MealSteps;
  final int MealDuration;
  final bool MealisGlutenPresent;
  final bool MealisLactosePresent;
  final bool MealisVegan;
  final bool MealisVegetarian;

  const MealDetailScreen({
    required this.MealId,
    required this.MealTitle,
    required this.MealimageUrl,
    required this.MealIngredients,
    required this.MealSteps,
    required this.MealDuration,
    required this.MealisGlutenPresent,
    required this.MealisLactosePresent,
    required this.MealisVegan,
    required this.MealisVegetarian,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final SelectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.imageUrl == MealimageUrl);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          MealTitle,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 15,
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    // MealimageUrl,
                    SelectedMeal.imageUrl,
                    height: mediaQuery.size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        MealTitle,
                        style: TextStyle(
                          // wordSpacing: Checkbox.width,
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: mediaQuery.size.height * 0.05,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(MealisGlutenPresent
                                      ? Icons.check_box
                                      : Icons.dangerous),
                                  Text('Gluten'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(MealisGlutenPresent
                                      ? Icons.check_box
                                      : Icons.dangerous),
                                  Text('Lactose'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(MealisVegan
                                      ? Icons.check_box
                                      : Icons.dangerous),
                                  Text('Vegan'),
                                  Row(
                                    children: [
                                      Icon(MealisVegetarian
                                          ? Icons.check_box
                                          : Icons.dangerous),
                                      Text('Vegetarian'),
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        height: mediaQuery.size.height * 0.05,
                        //padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer_outlined),
                            Center(
                                child: Text('Duration: ' '$MealDuration min'))
                          ],
                        ),
                      ),

                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      Container(
                        height: mediaQuery.size.height * 0.05,
                        //padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        height: mediaQuery.size.height * 0.20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5.0),
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  SelectedMeal.ingredients[index],
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: SelectedMeal.ingredients.length,
                        ),
                      ),
                      Container(
                        height: mediaQuery.size.height * 0.05,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          'Cooking Instructions',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            // fontSize: Checkbox.width,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: mediaQuery.size.height * 0.20,
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5.0),
                              // elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  SelectedMeal.steps[index],
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: SelectedMeal.steps.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
