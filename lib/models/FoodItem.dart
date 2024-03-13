import 'package:flutter/material.dart';

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
}

List<Food> foods = [
  Food(
    name: "Rice",
    image: "assets/images/123.png",
    time: 30,
    rate: 4.5,
    review: 20,
    isLiked: true,
  ),
  Food(
    name: "Banana",
    image: "assets/images/2.png",
    time: 20,
    rate: 4.0,
    review: 15,
    isLiked: false,
  ),
  Food(
    name: "Fried Chicken",
    image: "assets/images/3.png",
    time: 25,
    rate: 4.2,
    review: 18,
    isLiked: true,
  ),
  Food(
    name: "Grilled Beef",
    image: "assets/images/4.png",
    time: 35,
    rate: 4.7,
    review: 25,
    isLiked: false,
  ),
  Food(
    name: "Grilled Chicken",
    image: "assets/images/1.png",
    time: 30,
    rate: 4.5,
    review: 20,
    isLiked: true,
  ),
  Food(
    name: "Fried Egg",
    image: "assets/images/2.png",
    time: 20,
    rate: 4.0,
    review: 15,
    isLiked: false,
  ),
  Food(
    name: "Fried Chicken",
    image: "assets/images/3.png",
    time: 25,
    rate: 4.2,
    review: 18,
    isLiked: true,
  ),
  Food(
    name: "Grilled Beef",
    image: "assets/images/4.png",
    time: 35,
    rate: 4.7,
    review: 25,
    isLiked: false,
  ),
];

TextStyle foodStyle = TextStyle(
  fontSize: 18,
  fontFamily: "poppins",
);

List<Food> foods1 = [
  Food(
    name: "Grilled banana",
    image: "assets/images/2.png",
    time: 30,
    rate: 4.5,
    review: 20,
    isLiked: true,
  ),
  Food(
    name: "Fried Egg",
    image: "assets/images/3.png",
    time: 20,
    rate: 4.0,
    review: 15,
    isLiked: false,
  ),
  Food(
    name: "Fried Chicken",
    image: "assets/images/2.png",
    time: 25,
    rate: 4.2,
    review: 18,
    isLiked: true,
  ),
  Food(
    name: "Grilled Beef",
    image: "assets/images/1.png",
    time: 35,
    rate: 4.7,
    review: 25,
    isLiked: false,
  ),
  Food(
    name: "Grilled Chicken",
    image: "assets/images/4.png",
    time: 30,
    rate: 4.5,
    review: 20,
    isLiked: true,
  ),
  Food(
    name: "Fried Egg",
    image: "assets/images/3.png",
    time: 20,
    rate: 4.0,
    review: 15,
    isLiked: false,
  ),
  Food(
    name: "Fried Chicken",
    image: "assets/images/2.png",
    time: 25,
    rate: 4.2,
    review: 18,
    isLiked: true,
  ),
  Food(
    name: "Grilled Beef",
    image: "assets/images/1.png",
    time: 35,
    rate: 4.7,
    review: 25,
    isLiked: false,
  ),
];
