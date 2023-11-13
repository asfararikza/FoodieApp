import 'package:flutter/material.dart';
import 'package:random_resep/screen/dummy/dummy_data.dart';

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
            backgroundColor: Colors.white,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                padding: EdgeInsets.all(30),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      data.recipeData["recipes"][0]["image"].toString(),
                      fit: BoxFit.cover,
                    )),
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
                  color: Colors.white,
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
                              icon: Icon(Icons.favorite_border_outlined),
                              onPressed: () {})
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 5.0,
                // ),
                // Card(
                //   child:
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.deepOrange[200],
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["nameClean"]}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["amount"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["unit"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.deepOrange[200],
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["nameClean"]}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["amount"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["unit"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.deepOrange[200],
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["nameClean"]}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["amount"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["unit"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.deepOrange[200],
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["nameClean"]}",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["amount"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "${data.recipeData["recipes"][0]["extendedIngredients"][0]["unit"]}",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700]),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.deepOrange,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[50],
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][0]["step"]}",
                                style: TextStyle(fontSize: 16.0),
                              )
                              // ]
                              // List.generate(
                              //   4,
                              //   (index) => Text(
                              //     "${index + 1}. ${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][index]["step"]}",
                              //     style: TextStyle(fontSize: 16.0),
                              //   ),
                              // ),
                              // ),
                              ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[50],
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][1]["step"]}",
                                style: TextStyle(fontSize: 16.0),
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[50],
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][2]["step"]}",
                                style: TextStyle(fontSize: 16.0),
                              )),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[50],
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                "${data.recipeData["recipes"][0]["analyzedInstructions"][0]["steps"][3]["step"]}",
                                style: TextStyle(fontSize: 16.0),
                              )),
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
