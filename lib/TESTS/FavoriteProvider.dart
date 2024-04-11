import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Food> favoriteFoods = [];

  void toggleFavoriteStatus(Food food) {
    if (favoriteFoods.contains(food)) {
      favoriteFoods.remove(food);
    } else {
      favoriteFoods.add(food);
    }
    notifyListeners();
  }

  bool isFavorite(Food food) {
    return favoriteFoods.contains(food);
  }
}
