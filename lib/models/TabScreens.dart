import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/widgets/FoodItemRow.dart';
import '../models/food_model.dart';


List<Food> fetchDataFromFirestore() {


  List<Food> foods = []; // Initialize empty list
  return foods;
}

List<Widget> generateTabscreens() {
  List<Food> foods = fetchDataFromFirestore(); // Fetch data Firestore
  return [
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods),
  ];
}

List Tabscreens1 = generateTabscreens();

// List<Widget> ChefTab = [
//   ChefDetails(chefs: chefs),
//   Text("gggg"),
//   Text("data"),
//   ChefDetails(chefs: chefs),
//   ChefDetails(chefs: chefs),
//   ChefDetails(chefs: chefs),
// ];
