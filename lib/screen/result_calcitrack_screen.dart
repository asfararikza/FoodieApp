import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:random_resep/api/get_random_recipes_api.dart';
import 'package:random_resep/api/recipes_model.dart';
import 'package:random_resep/api/suggestion_recipe_api.dart';
import 'package:random_resep/api/suggestion_recipe_model.dart';
import 'package:random_resep/dummy_data.dart';

class ResultCalciTrackScreen extends StatefulWidget {
  const ResultCalciTrackScreen({
    super.key,
    required this.bmiResult,
    required this.bmiText,
    required this.bmiAdvise,
    required this.bmiTextColor,
    required this.bmrResult,
    required this.mincaloriePerMeal,
    required this.maxcaloriePerMeal,
  });
  final String bmiResult;
  final String bmiText;
  final String bmiAdvise;
  final Color bmiTextColor;
  final String bmrResult;
  final String mincaloriePerMeal;
  final String maxcaloriePerMeal;

  @override
  State<ResultCalciTrackScreen> createState() => _ResultCalciTrackScreenState();
}

class _ResultCalciTrackScreenState extends State<ResultCalciTrackScreen> {
  final data = dummyRecipe();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //BMI Result
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "BMI Result",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.bmiText,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: widget.bmiTextColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.bmiResult,
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //BMI Advise
                SizedBox(height: 20),
                Center(
                  child: Text(
                    widget.bmiAdvise,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),

                //BMR Result
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "BMR Result",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Calories",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: widget.bmiTextColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.bmrResult,
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "kcal",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //Calorie per meal
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Based on your BMI, you need to consume at least ",
                      ),
                      TextSpan(
                        text:
                            "${widget.mincaloriePerMeal} - ${widget.maxcaloriePerMeal}",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " calories per meal to get your ideal weight",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),

                //Recipes Suggestion
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recipes Suggestion",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                //Popular Recipes Cards
                FutureBuilder(
                  future: ApiSuggestionRecipes.instance.searchSuggestionRecipe(
                      widget.mincaloriePerMeal, widget.maxcaloriePerMeal),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("ADA ERROR");
                    }
                    if (snapshot.hasData && snapshot.data != null) {
                      // List<Map<String, dynamic>> jsonList = List.from(json.decode(snapshot.data!));

                      // List<SuggestionRecipesModel> recipes = jsonList
                      // .map((jsonRecipe) => SuggestionRecipesModel.fromJson(jsonRecipe))
                      // .toList();

                      // List<SuggestionRecipesModel> recipes = (json
                      //         .decode(snapshot.data as String) as List<dynamic>)
                      //     .map((jsonRecipe) =>
                      //         SuggestionRecipesModel.fromJson(jsonRecipe))
                      //     .toList();

                      // SuggestionRecipesModel recipes =
                      //     SuggestionRecipesModel.fromJson(snapshot.data!);

                      List<Map<String, dynamic>> listRecipes =
                          List.from(snapshot.data! as List<dynamic>);

                      List<SuggestionRecipesModel> recipes = listRecipes
                          .map((jsonRecipe) =>
                              SuggestionRecipesModel.fromJson(jsonRecipe))
                          .toList();

                      return buildCardRecipe(recipes: recipes);
                    }
                    return Text("Tidak ada rekomendasi resep");
                  },
                ),

                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     color: Colors.grey[200],
                //   ),
                //   padding: EdgeInsets.all(15),
                //   width: 220,
                //   margin: EdgeInsets.only(right: 15),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       //Recipe Image
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //         child: Image.network(
                //           data.recipeData["recipes"][0]["image"].toString(),
                //           height: 130,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 15,
                //       ),

                //       //Recipe Title
                //       Text(
                //         data.recipeData["recipes"][0]["title"].toString(),
                //         style: TextStyle(
                //           fontSize: 19,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         overflow: TextOverflow.ellipsis,
                //         maxLines: 1,
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),

                //       //Recipe Calories

                //       // FutureBuilder(
                //       //   future: ApiRandomRecipes.instance
                //       //       .informationRecipe("660504"),
                //       //   builder:
                //       //       (BuildContext context, AsyncSnapshot snapshot) {
                //       //     if (snapshot.hasData && snapshot.data != null) {
                //       //       InfoRecipeModel dataInfo =
                //       //           InfoRecipeModel.fromJson(snapshot.data!);
                //       //       return Text(
                //       //           " ${dataInfo.nutrition?.nutrients?[0].amount} Calories",
                //       //           style: TextStyle(color: Colors.deepOrange));
                //       //     }
                //       //     return Text(
                //       //       "Calories",
                //       //       style: TextStyle(color: Colors.deepOrange),
                //       //     );
                //       //   },
                //       // ),

                //       SizedBox(
                //         height: 10,
                //       ),

                //       //Recipe Info
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Row(
                //             children: [
                //               Icon(
                //                 Icons.schedule_outlined,
                //                 color: Colors.grey,
                //                 size: 15,
                //               ),
                //               SizedBox(
                //                 width: 8,
                //               ),
                //               Text(
                //                 "${data.recipeData["recipes"][0]["readyInMinutes"]} mins",
                //                 style: TextStyle(color: Colors.grey),
                //               ),
                //             ],
                //           ),
                //           Row(
                //             children: [
                //               Icon(
                //                 Icons.room_service_outlined,
                //                 color: Colors.grey,
                //                 size: 15,
                //               ),
                //               SizedBox(
                //                 width: 8,
                //               ),
                //               Text(
                //                 "${data.recipeData["recipes"][0]["servings"]} servings",
                //                 style: TextStyle(
                //                   color: Colors.grey,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}

class buildCardRecipe extends StatelessWidget {
  const buildCardRecipe({super.key, required this.recipes});
  final List<SuggestionRecipesModel> recipes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipes.length,
          itemBuilder: (BuildContext context, int index) {
            var recipe = recipes[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              padding: EdgeInsets.all(15),
              width: 220,
              margin: EdgeInsets.only(right: 15),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Recipe Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        recipe.image.toString(),
                        height: 135,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    //Recipe Title
                    Text(
                      recipe.title.toString(),
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //Recipe Calories
                    Text(" ${recipe.calories} Calories",
                        style: TextStyle(color: Colors.deepOrange)),

                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.lightGreen[100],
            //   ),
            //   padding: EdgeInsets.all(15),
            //   width: 200,
            //   margin: EdgeInsets.only(right: 15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(20),
            //         child: Image.network(
            //           recipe!.image.toString(),
            //           height: 120,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 15,
            //       ),
            //       Text(
            //         recipe.title.toString(),
            //         style: TextStyle(
            //           fontSize: 19,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         overflow: TextOverflow.ellipsis,
            //         maxLines: 1,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       )
            //     ],
            //   ),
            // );
          },
        ));
  }
}
