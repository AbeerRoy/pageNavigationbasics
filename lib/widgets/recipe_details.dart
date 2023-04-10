import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  final RecipeDetailsContext;
  double MediaQueryValue;
  int RecipeDetailsLength;

  RecipeDetails({
    required this.RecipeDetailsContext,
    required this.MediaQueryValue,
    required this.RecipeDetailsLength,
  });

  // final width = MediaQueryValue * 0.90

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: MediaQueryValue * 0.204,
      width: MediaQueryValue * 0.504,
      decoration: BoxDecoration(
        // border: Border.fromBorderSide(BorderSide.none),
        border: Border.all(
          color: Colors.grey,
        ),

        // borderRadius: BorderRadius.circular(25),
        // borderRadius: const BorderRadius.only(
        //   bottomLeft: Radius.circular(15),
        //   bottomRight: Radius.circular(15),
        // ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              // Container(
              //   padding: EdgeInsets.all(5.0),
              //   child:
              ListTile(
                title: Text(
                  RecipeDetailsContext[index],
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                  ),
                ),
              ),
              // ),
              Divider(
                color: Colors.blueGrey,
              ),
            ],
          );
        },
        itemCount: RecipeDetailsLength,
      ),
    );
  }
}
