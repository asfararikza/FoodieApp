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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                data.recipeData["recipes"][0]["image"].toString(),
                fit: BoxFit.cover,
              ),
            ),
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
                    .withOpacity(0.5), // Warna latar belakang lingkaran (hitam)
              ),
              margin: EdgeInsets.only(left: 10.0, top: 16.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white, // Warna ikon (putih)
                iconSize: 25.0,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.recipeData["recipes"][0]["title"].toString(),
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
                                    width: 15,
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
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: 16.0,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredients",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            4,
                            (index) => Text(
                              "- ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][index]["step"]}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey[200],
                  height: 16.0,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Instructions",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            4,
                            (index) => Text(
                              "${index + 1}. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][index]["step"]}",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
