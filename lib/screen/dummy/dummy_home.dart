import 'package:flutter/material.dart';
import 'package:random_resep/api/info_recipe_model.dart';
import 'package:random_resep/api/nutrients_model.dart';
import 'package:random_resep/screen/category_screen.dart';
import 'package:random_resep/screen/dummy/dummy_data.dart';
import 'package:random_resep/api/get_random_recipes_api.dart';
import 'package:random_resep/api/recipes_model.dart';
import 'package:random_resep/screen/detaill_recipe_screen.dart';
import 'package:random_resep/screen/dummy/dummy_category_screen.dart';
import 'package:random_resep/screen/result_search_screen.dart';

class dummyHomeScreen extends StatefulWidget {
  const dummyHomeScreen({super.key});

  @override
  State<dummyHomeScreen> createState() => _dummyHomeScreenState();
}

class _dummyHomeScreenState extends State<dummyHomeScreen> {
  final data = dummyRecipe();
  final searchQuery = TextEditingController();

  // UserAccount? user = HiveService.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  color: Colors.lightGreen[100],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Recipes",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.zero,
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            controller: searchQuery,
                            onSubmitted: (value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultSearchScreen(
                                            query: value,
                                          )));
                              searchQuery.clear();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),

                // Text(
                //   "Hello, ${user?.username}",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                // ),

                Text(
                  "Let's Eat",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Healthy Food",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 35,
                ),
                //Recipe Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      KategoriButton(
                        namaKategori: "Brunch",
                        iconKategori: Icons.breakfast_dining_rounded,
                        tags: "breakfast",
                      ),
                      KategoriButton(
                        namaKategori: "Lunch",
                        iconKategori: Icons.lunch_dining_rounded,
                        tags: "lunch",
                      ),
                      KategoriButton(
                        namaKategori: "Dinner",
                        iconKategori: Icons.dinner_dining_rounded,
                        tags: "dinner",
                      ),
                      KategoriButton(
                          namaKategori: "Vegan",
                          iconKategori: Icons.icecream_rounded,
                          tags: "vegetarian"),
                      KategoriButton(
                        namaKategori: "Dessert",
                        iconKategori: Icons.cake_rounded,
                        tags: "dessert",
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                SizedBox(
                  height: 30,
                ),

                //Popular Recipes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Fresh Recipes",
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailRecipeScreen(
                                  RecipeId: data.recipeData["recipes"][0]["id"]
                                      .toString(),
                                )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(15),
                    width: 220,
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Recipe Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            data.recipeData["recipes"][0]["image"].toString(),
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        //Recipe Title
                        Text(
                          data.recipeData["recipes"][0]["title"].toString(),
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

                        // FutureBuilder(
                        //   future: ApiRandomRecipes.instance
                        //       .informationRecipe("660504"),
                        //   builder:
                        //       (BuildContext context, AsyncSnapshot snapshot) {
                        //     if (snapshot.hasData && snapshot.data != null) {
                        //       InfoRecipeModel dataInfo =
                        //           InfoRecipeModel.fromJson(snapshot.data!);
                        //       return Text(
                        //           " ${dataInfo.nutrition?.nutrients?[0].amount} Calories",
                        //           style: TextStyle(color: Colors.deepOrange));
                        //     }
                        //     return Text(
                        //       "Calories",
                        //       style: TextStyle(color: Colors.deepOrange),
                        //     );
                        //   },
                        // ),

                        SizedBox(
                          height: 10,
                        ),

                        //Recipe Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule_outlined,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${data.recipeData["recipes"][0]["readyInMinutes"]} mins",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.room_service_outlined,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "${data.recipeData["recipes"][0]["servings"]} servings",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class KategoriButton extends StatelessWidget {
  final String namaKategori;
  final IconData iconKategori;
  final String tags;

  KategoriButton(
      {Key? key,
      required this.namaKategori,
      required this.iconKategori,
      required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                        categoryName: namaKategori,
                        tags: tags,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.lightGreen[100],
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Icon(
                  iconKategori,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                namaKategori,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
