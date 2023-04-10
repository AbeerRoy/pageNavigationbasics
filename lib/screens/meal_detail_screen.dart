import 'package:flutter/material.dart';
import '../dummy_data.dart';
// import '../widgets/meal_item.dart';
import '../widgets/recipe_details.dart';

class MealDetailScreen extends StatelessWidget {
  // final String MealId;
  // final String MealTitle;
  // final String MealimageUrl;
  // final List<String> MealIngredients;
  // final List<String> MealSteps;
  // final int MealDuration;
  // final bool MealisGlutenPresent;
  // final bool MealisLactosePresent;
  // final bool MealisVegan;
  // final bool MealisVegetarian;

  // const MealDetailScreen({
  //   required this.MealId,
  //   required this.MealTitle,
  //   required this.MealimageUrl,
  //   required this.MealIngredients,
  //   required this.MealSteps,
  //   required this.MealDuration,
  //   required this.MealisGlutenPresent,
  //   required this.MealisLactosePresent,
  //   required this.MealisVegan,
  //   required this.MealisVegetarian,
  // });

  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen({required this.toggleFavourite, required this.isFavourite});

  Widget _safety(SafetyCheckParameter) {
    return Container(
      child:
          // Icon(MealisGlutenPresent
          Icon(SafetyCheckParameter ? Icons.check_box : Icons.dangerous),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final MealID = ModalRoute.of(context)!.settings.arguments as String;

// firstWhere Returns the first element(one meal class instead of multiple meal classes which is accessed by where) that satisfies the given predicate [test].
// Iterates through elements and returns the first to satisfy [test].
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealID);
//safety check row
    _safetycheck() {
      return Container(
        height: mediaQuery.size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _safety(
              selectedMeal.isGlutenPresent,
            ),
            Text('Gluten'),
            _safety(
              selectedMeal.isLactosePresent,
            ),
            Text('Lactose'),
            _safety(
              selectedMeal.isVegan,
            ),
            Text('Vegan'),
            _safety(
              selectedMeal.isVegetarian,
            ),
            Text('Vegetarian'),
          ],
        ),
      );
    }

    Widget buildSectionTitle(String text) {
      return Container(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
            softWrap: true,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          selectedMeal.title,
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
          child: Container(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15),
            // ),
            // elevation: 15,
            // margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        selectedMeal.imageUrl,
                        //SelectedMeal.imageUrl,
                        height: mediaQuery.size.height * 0.25,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Container(
                        // width: 250,
                        // color: Colors.black54,
                        // padding: EdgeInsets.all(5.0),
                        child: FloatingActionButton(
                          backgroundColor: Theme.of(context).splashColor,
                          child: Icon(
                            //Icons.favorite,
                            isFavourite(MealID)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Color.fromARGB(255, 255, 102, 153),
                          ),
                          onPressed: () => toggleFavourite(MealID),

                          // style: TextStyle(fontSize: 18, color: Colors.white),
                          // softWrap: true,
                          // overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),

                buildSectionTitle(selectedMeal.title.toString()),
                //safety check row
                _safetycheck(),

                Container(
                  height: mediaQuery.size.height * 0.05,
                  //padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer_outlined),
                      Center(
                          // child: Text('Duration: ' '$MealDuration min'))
                          // ignore: prefer_interpolation_to_compose_strings
                          child: Text('Duration: ' +
                              selectedMeal.duration.toString() +
                              'min'))
                    ],
                  ),
                ),
                buildSectionTitle('Ingredients'),
                RecipeDetails(
                    RecipeDetailsContext: selectedMeal.ingredients,
                    MediaQueryValue: mediaQuery.size.height,
                    RecipeDetailsLength: selectedMeal.ingredients.length),

                buildSectionTitle('Instructions'),
                RecipeDetails(
                    RecipeDetailsContext: selectedMeal.steps,
                    MediaQueryValue: mediaQuery.size.height,
                    RecipeDetailsLength: selectedMeal.steps.length),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
