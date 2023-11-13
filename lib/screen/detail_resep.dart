import 'package:flutter/material.dart';
import 'package:random_resep/dummy_data.dart';

class DetailRecipeScreen extends StatefulWidget {
  const DetailRecipeScreen({super.key, required this.RecipeId});
  final String RecipeId;

  @override
  State<DetailRecipeScreen> createState() => _DetailRecipeScreenState();
}

class _DetailRecipeScreenState extends State<DetailRecipeScreen> {
  final data = dummyRecipe();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Center(
        //     child: Text("Foodie",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         )),
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   iconTheme: IconThemeData(color: Colors.black),
        // ),
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        data.recipeData["recipes"][0]["image"].toString(),
                      ),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              top: 250,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                // width: 400,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                          data.recipeData["recipes"][0]["title"].toString(),
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Calories",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.deepOrange),
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
                                  "${data.recipeData["recipes"][0]["readyInMinutes"]} mins",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.room_service_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "${data.recipeData["recipes"][0]["servings"]} servings",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            icon: Icon(Icons.favorite_border_outlined),
                            onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Ingredients",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${data.recipeData["recipes"][0]["diets"]}"),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Instructions:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "1. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][0]["step"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "2. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][1]["step"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "3. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][2]["step"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "4. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][3]["step"]}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
