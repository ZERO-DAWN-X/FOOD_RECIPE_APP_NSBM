import 'package:flutter/material.dart';

class FavoriteChef {
  String chefName;
  String foodName;
  String chefImage;
  String foodImage;
  double cookTime;

  FavoriteChef({
    required this.chefName,
    required this.foodName,
    required this.chefImage,
    required this.foodImage,
    required this.cookTime,
  });

  // Convert FavoriteChef object to a Map
  Map<String, dynamic> toMap() {
    return {
      'chef_Name': chefName,
      'food_Name': foodName,
      'chef_Image': chefImage,
      'food_Image': foodImage,
      'cook_Time': cookTime,
    };
  }
}

class Food {
  String name;
  String image;
  double time;
  double rate;
  int review;
  bool isLiked;

  Food({
    required this.name,
    required this.image,
    required this.time,
    required this.rate,
    required this.review,
    required this.isLiked,
  });

  // Convert Food object to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'time': time,
      'rate': rate,
      'review': review,
      'isLiked': isLiked,
    };
  }
}

TextStyle foodStyle = const TextStyle(
  fontSize: 18,
  fontFamily: "poppins",
);

// void addFoodsToFirestore() async {
//   CollectionReference foodsRef =
//       FirebaseFirestore.instance.collection('foods');

//   // Your list of foods
//   List<Food> foods = [
//     Food(
//     name: "Rice",
//     image: "assets/images/F3.jpg",
//     time: 30,
//     rate: 4.5,
//     review: 20,
//     isLiked: true,
//   ),
//   Food(
//     name: "Banana",
//     image: "assets/images/F2.jpg",
//     time: 20,
//     rate: 4.0,
//     review: 15,
//     isLiked: false,
//   ),
//   Food(
//     name: "Fried Chicken",
//     image: "assets/images/F1.jpg",
//     time: 25,
//     rate: 4.2,
//     review: 18,
//     isLiked: true,
//   ),
//   Food(
//     name: "Grilled Beef",
//     image: "assets/images/2.png",
//     time: 35,
//     rate: 4.7,
//     review: 25,
//     isLiked: false,
//   ),
//   Food(
//     name: "Grilled Chicken",
//     image: "assets/images/F1.jpg",
//     time: 30,
//     rate: 4.5,
//     review: 20,
//     isLiked: true,
//   ),
//   Food(
//     name: "Fried Egg",
//     image: "assets/images/F2.jpg",
//     time: 20,
//     rate: 4.0,
//     review: 15,
//     isLiked: false,
//   ),
//   Food(
//     name: "Fried Chicken",
//     image: "assets/images/F3.jpg",
//     time: 25,
//     rate: 4.2,
//     review: 18,
//     isLiked: true,
//   ),
//   Food(
//     name: "Grilled Beef",
//     image: "assets/images/2.png",
//     time: 35,
//     rate: 4.7,
//     review: 25,
//     isLiked: false,
//   ),

//   // ------------------------------------------
  
//   ];

//   // Loop through the list of foods and add them to Firestore
//   for (var food in foods) {
//     await foodsRef.add(food.toMap());
//   }
// }