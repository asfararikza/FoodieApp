import 'package:flutter/material.dart';
import 'package:random_resep/api/get_random_recipes_api.dart';
import 'package:random_resep/api/recipes_model.dart';
import 'package:random_resep/api/suggestion_recipe_api.dart';
import 'package:random_resep/api/suggestion_recipe_model.dart';
import 'package:random_resep/screen/detaill_recipe_screen.dart';

class AllSuggestionScreen extends StatefulWidget {
  const AllSuggestionScreen(
      {super.key, required this.minCal, required this.maxCal});
  final String minCal;
  final String maxCal;

  @override
  State<AllSuggestionScreen> createState() => _AllSuggestionScreenState();
}

class _AllSuggestionScreenState extends State<AllSuggestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Suggestions Recipes",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ApiSuggestionRecipes.instance
            .allSuggestionRecipe(widget.minCal, widget.maxCal),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            List<Map<String, dynamic>> listRecipes =
                List.from(snapshot.data! as List<dynamic>);

            List<SuggestionRecipesModel> recipes = listRecipes
                .map(
                    (jsonRecipe) => SuggestionRecipesModel.fromJson(jsonRecipe))
                .toList();
            return _buildHomeScreen(recipes: recipes);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _buildHomeScreen extends StatelessWidget {
  const _buildHomeScreen({super.key, required this.recipes});
  final List<SuggestionRecipesModel> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.85,
      ),
      itemCount: recipes.length,
      itemBuilder: (BuildContext context, int index) {
        var recipe = recipes[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailRecipeScreen(RecipeId: recipe!.id.toString())));
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    recipe!.image.toString(),
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          size: 18,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          recipe.calories.toString() + "kcal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.grey[400],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
