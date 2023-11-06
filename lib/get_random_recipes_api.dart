import 'dart:convert';
import 'package:random_resep/recipes_model.dart';
import 'package:http/http.dart' as http;
import 'base_network.dart';

class ApiRandomRecipes {
  static ApiRandomRecipes instance = ApiRandomRecipes();
  Future<Map<String, dynamic>> loadRandomRecipes() {
    return BaseNetwork.get(
        "recipes/random?apiKey=0dd4eb84a40745b9a88fcf7361d5683d&number=10");
  }
}
