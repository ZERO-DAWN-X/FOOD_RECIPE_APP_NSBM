import 'package:flutter/material.dart';

class TopStatus {
  String name;
  String image;
  String profile;
  String chef;

  TopStatus({
    required this.name,
    required this.image,
    required this.profile,
    required this.chef,
  });
}

List<TopStatus> Status = [
  TopStatus(
    name: "Ice-Cream",
    image: "assets/images/21.jpg",
    profile: "assets/images/p1.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Snack Food",
    image: "assets/images/22.jpg",
    profile: "assets/images/p2.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Fried Chicken",
    image: "assets/images/23.png",
    profile: "assets/images/p3.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Grilled Beef",
    image: "assets/images/22.jpg",
    profile: "assets/images/p1.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Grilled Chicken",
    image: "assets/images/21.jpg",
    profile: "assets/images/p2.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Grilled Fish",
    image: "assets/images/23.png",
    profile: "assets/images/p3.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Grilled Pork",
    image: "assets/images/22.jpg",
    profile: "assets/images/p1.png",
    chef: "Venuja Vethmin",
  ),
  TopStatus(
    name: "Grilled Shrimp",
    image: "assets/images/21.jpg",
    profile: "assets/images/p2.png",
    chef: "Venuja Vethmin",
  ),
];
