import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/RecipeScreen.dart';
import 'package:iconsax/iconsax.dart';
import '../models/FoodItem.dart';

class FoodItemRow extends StatefulWidget {
  final List<Food> foods;
  const FoodItemRow({super.key, required this.foods});

  @override
  State<FoodItemRow> createState() => _FoodItemRowState();
}

class _FoodItemRowState extends State<FoodItemRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.foods.length,
        (index) => GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeScreen(food: widget.foods[index]),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(right: 15),
            width: 260,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(widget.foods[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.foods[index].name,
                      style: foodStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 1, right: 1),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Iconsax.clock,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                SizedBox(width: 7),
                                Text("${widget.foods[index].time} min",
                                    style: foodStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                            SizedBox(width: 20),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.medal_star5,
                                  color: Color.fromARGB(255, 24, 141, 20),
                                  size: 17,
                                ),
                                SizedBox(width: 5),
                                Text(
                                    "${widget.foods[index].rate} (${widget.foods[index].review} reviews)",
                                    style: foodStyle.copyWith(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 1,
                  right: 1,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.foods[index].isLiked =
                            !widget.foods[index].isLiked;
                        widget.foods[index].review = widget.foods[index].isLiked
                            ? widget.foods[index].review + 1
                            : widget.foods[index].review - 1;
                      });
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(18, 18),
                    ),
                    iconSize: 16,
                    icon: Icon(
                      widget.foods[index].isLiked
                          ? Iconsax.heart5
                          : Iconsax.heart,
                      color: widget.foods[index].isLiked
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
