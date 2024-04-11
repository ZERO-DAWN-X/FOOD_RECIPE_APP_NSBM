import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/TabScreens.dart';
import '../constants.dart';

const List<String> categories = [
  "All",
  "New Arrival",
  "Best Recipes",
  "Hot Deals",
  "Favorites",
];

class CategoryButtons extends StatefulWidget {
  const CategoryButtons({super.key});

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  // ------------ Selected Button ------------
  int selectedBtn = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // ------------ Category Buttons ------------
          child: Row(
            children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () => setState(() {
                  selectedBtn = index;
                }),
                child: Container(
                  decoration: CategoryBtnDecoration.copyWith(
                    color:
                        index == selectedBtn ? Colors.black : Colors.grey[200],
                  ),
                  padding: CategoryBtnPadding,
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    categories[index],
                    style: CategoryBtnStyle.copyWith(
                      color: index == selectedBtn ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        // ------------ Food Recipes ------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Food Recipes",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            // ------------ View All Button ------------
            TextButton(
              onPressed: () {},
              child: const Text(
                "View All",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // ------------ Food Items ------------
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Tabscreens1[selectedBtn],
            ],
          ),
        ),
        const SizedBox(height: 20),
        // ------------ Food Items ------------
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Tabscreens1[selectedBtn],
            ],
          ),
        ),
      ],
    );
  }
}
