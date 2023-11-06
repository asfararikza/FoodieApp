import 'package:flutter/material.dart';
import 'package:random_resep/get_random_recipes_api.dart';
import 'package:random_resep/model.dart';
import 'package:random_resep/recipes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Foodie",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: ApiRandomRecipes.instance.loadRandomRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            // RecipesModel recipes = RecipesModel.fromJson(snapshot.data!);
            RecipeModel recipes = RecipeModel.fromJson(snapshot.data!);
            return _buildHomeScreen(recipes);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget _buildHomeScreen(RecipeModel recipes) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Let's Eat",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          "Healthy Food",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Popular Recipes",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.recipes?.length,
              itemBuilder: (BuildContext context, int index) {
                var recipe = recipes.recipes?[index];

                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restaurant_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "${recipe.servings}",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${recipe.readyInMinutes} min",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("View Recipe"),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ))
                    ],
                  ),
                );
              },
            )),
      ]));
}
