import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/FoodItem.dart';

class FoodItemRow extends StatefulWidget {
  const FoodItemRow({super.key});

  @override
  State<FoodItemRow> createState() => _FoodItemRowState();
}

class _FoodItemRowState extends State<FoodItemRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        foods.length,
        (index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 15),
            width: 250,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(foods[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      foods[index].name,
                      style: foodStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.only(left: 1, right: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Iconsax.clock,
                                color: Colors.grey,
                                size: 17,
                              ),
                              SizedBox(width: 7),
                              Text("${foods[index].time} min",
                                  style: foodStyle.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Iconsax.medal_star5,
                                color: Color.fromARGB(255, 24, 141, 20),
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text(
                                  "${foods[index].rate} (${foods[index].review} reviews)",
                                  style: foodStyle.copyWith(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
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
                        foods[index].isLiked = !foods[index].isLiked;
                        foods[index].review = foods[index].isLiked
                            ? foods[index].review + 1
                            : foods[index].review - 1;
                      });
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(18, 18),
                    ),
                    iconSize: 16,
                    icon: Icon(
                      foods[index].isLiked ? Iconsax.heart5 : Iconsax.heart,
                      color: foods[index].isLiked ? Colors.red : Colors.black,
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
