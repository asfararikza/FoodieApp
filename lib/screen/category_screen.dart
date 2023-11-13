import 'package:flutter/material.dart';
import 'package:random_resep/api/get_random_recipes_api.dart';
import 'package:random_resep/api/recipes_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen(
      {super.key, required this.categoryName, required this.tags});
  final String categoryName;
  final String tags;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.categoryName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder(
        future: ApiRandomRecipes.instance.categoryRecipes(widget.tags),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData && snapshot.data != null) {
            RecipeModel recipes = RecipeModel.fromJson(snapshot.data!);
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
  final RecipeModel recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.85,
      ),
      itemCount: recipes.recipes?.length,
      itemBuilder: (BuildContext context, int index) {
        var recipe = recipes.recipes?[index];
        return Container(
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
                        recipe.readyInMinutes.toString() + " mins",
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
        );
      },
    );
  }
}
