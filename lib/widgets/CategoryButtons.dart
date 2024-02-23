import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/constans.dart';

class CategoryButtons extends StatefulWidget {
  const CategoryButtons({super.key});

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "All",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "New Arrival",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "Recipes",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "Favourites",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "Best",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                print("Work");
              });
            },
            child: Container(
              decoration: CategoryBtnDecoration,
              padding: CategoryBtnPadding,
              child: Text(
                "Hot Recipes",
                style: CategoryBtnStyle,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
