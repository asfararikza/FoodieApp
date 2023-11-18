import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_resep/api/get_random_recipes_api.dart';
import 'package:random_resep/api/info_recipe_model.dart';
import 'package:random_resep/data/database.dart';
import 'package:random_resep/data/favorite_model.dart';
import 'package:random_resep/screen/dummy/dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailRecipeScreen extends StatefulWidget {
  const DetailRecipeScreen({super.key, required this.RecipeId});
  final String RecipeId;

  @override
  State<DetailRecipeScreen> createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  final data = dummyRecipe();

  late SharedPreferences _logindata;
  late String _email = '';
  bool _isFavorite = false;
  List<FavoriteRecipe> _favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    _logindata = await SharedPreferences.getInstance();
    setState(() {
      _email = _logindata.getString('email')!;
    });
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    List<Map<String, dynamic>> favoriteList =
        await DatabaseHelper.instance.getListFavorite(_email);
    List<FavoriteRecipe> favoriteRecipes =
        favoriteList.map((map) => FavoriteRecipe.fromMap(map)).toList();

    setState(() {
      _favoriteRecipes = favoriteRecipes;
      _isFavorite =
          _favoriteRecipes.any((recipe) => recipe.recipeId == widget.RecipeId);
    });
    print(_isFavorite);
    print(_favoriteRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Recipe",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: FutureBuilder(
          future: ApiRandomRecipes.instance.informationRecipe(widget.RecipeId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ADA ERROR");
            }
            if (snapshot.hasData && snapshot.data != null) {
              InfoRecipeModel recipe = InfoRecipeModel.fromJson(snapshot.data!);
              return ListView(
                children: [
                  Image.network(
                    recipe.image.toString(),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.title.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${recipe.nutrition?.nutrients![0].amount} Calories",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${recipe.readyInMinutes} mins",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    // Icon(
                                    //   Icons.room_service_outlined,
                                    //   size: 20,
                                    //   color: Colors.grey,
                                    // ),
                                    // Text(
                                    //   "${data.recipeData["recipes"][0]["servings"]} servings",
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     color: Colors.grey,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                icon: _isFavorite
                                    ? Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_border_outlined),
                                onPressed: () {
                                  var mins = recipe.readyInMinutes;
                                  var serving = recipe.servings;
                                  var image = recipe.image;
                                  var title = recipe.title;
                                  var cal = recipe
                                      .nutrition?.nutrients![0].amount
                                      .toString();

                                  _toggleFavoriteStatus(
                                      image.toString(),
                                      title.toString(),
                                      mins.toString(),
                                      serving.toString(),
                                      cal.toString());
                                })
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.deepOrange,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Ingredients",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.room_service_outlined,
                                      color: Colors.deepOrange),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${data.recipeData["recipes"][0]["servings"]} servings",
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 16.0),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe.extendedIngredients?.length,
                            itemBuilder: (BuildContext context, int index) {
                              var ingredients =
                                  recipe.extendedIngredients?[index];
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.deepOrange[200],
                                            ),
                                            Text(
                                              "${ingredients?.nameClean}",
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${ingredients?.amount}",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey[700]),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "${ingredients?.unit}",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.grey[700]),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Instructions",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe
                                    .analyzedInstructions?[0]["steps"].length ??
                                0,
                            itemBuilder: (BuildContext context, int index) {
                              var instruction = recipe.analyzedInstructions?[0]
                                  ["steps"][index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      padding: EdgeInsets.all(15.0),
                                      child: Text("${instruction["step"]}",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white),
                                          ))),
                                  SizedBox(height: 8.0),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Future<void> _toggleFavoriteStatus(String image, String title, String ready,
      String serving, String cal) async {
    String message = '';
    late Color color;
    if (_isFavorite) {
      // Hapus dari daftar favorit
      await DatabaseHelper.instance
          .deleteFavorite(_email, widget.RecipeId, 'favorite_recipes');
      message = 'Recipe removed from favorite';
      color = Colors.red;
    } else {
      // Tambahkan ke daftar favorit
      await DatabaseHelper.instance.insertFavorite(
        _email,
        widget.RecipeId,
        image,
        title,
        ready,
        serving,
        cal,
      );
      message = 'Recipe added to favorite';
      color = Colors.green;
    }

    // Perbarui status favorit
    _checkFavoriteStatus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: color,
      ),
    );
    print(message);
  }
}
