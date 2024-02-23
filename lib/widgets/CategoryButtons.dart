import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/Test.dart';
import 'package:food_recipe_app_nsbm/widgets/FoodItemRow.dart';
import '../constans.dart';

const List<String> categories = [
  "All",
  "New Arrival",
  "Best Resipes",
  "Hot Deals",
  "Favourites",
];

int TabBtn = 0;

const List Tabscreens = [
  Test(),
  FoodItemRow(),
  Test(),
  FoodItemRow(),
  FoodItemRow(),
];

class CategoryButtons extends StatefulWidget {
  const CategoryButtons({super.key});

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  int selectedBtn = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () => setState(() {
                  selectedBtn = index;
                  TabBtn = index;
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
          SizedBox(height: 5),
          Container(
            width: 150,
            height: 100,
            child: Tabscreens[TabBtn],
          )
          // SizedBox(height: 20),
          // Row(
          //   children: List.generate(
          //     10,
          //     (index) => Container(
          //       decoration: boxDecoration,
          //       margin: EdgeInsets.only(right: 15),
          //       height: 170,
          //       width: 280,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
