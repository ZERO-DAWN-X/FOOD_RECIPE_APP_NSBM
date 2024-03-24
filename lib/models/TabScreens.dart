import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app_nsbm/models/Chef.dart';
import 'package:food_recipe_app_nsbm/widgets/ChefDetails.dart';
import 'package:food_recipe_app_nsbm/widgets/FoodItemRow.dart';

import 'FoodItem.dart';

List<Widget> generateTabscreens(List<Food> foods) {
  return [
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods1),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods1),
    FoodItemRow(foods: foods),
    FoodItemRow(foods: foods1)
  ];
}

List<Widget> Tabscreens1 = generateTabscreens(foods);
List<Widget> Tabscreens2 = generateTabscreens(foods1);

// List Tabscreens1 = [
//   Test(),
//   FoodItemRow(foods: foods),
//   Test(),
//   FoodItemRow(foods: foods),
//   Test(),
//   FoodItemRow(foods: foods)
// ];

List<Widget> ChefTab = [
  ChefDetails(chefs: chefs),
  Text("gggg"),
  Text("data"),
  ChefDetails(chefs: chefs),
  ChefDetails(chefs: chefs),
  ChefDetails(chefs: chefs),
];
