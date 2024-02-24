import 'package:flutter/material.dart';
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