import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/FoodItem.dart';
import 'package:food_recipe_app_nsbm/models/FoodItem.dart';
import 'package:iconsax/iconsax.dart';

class RecipeScreen extends StatefulWidget {
  final Food food;
  const RecipeScreen({super.key, required this.food});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int currentNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    backgroundColor: Color.fromARGB(255, 71, 201, 75),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Start Cooking",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Expanded(
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       padding: EdgeInsets.symmetric(vertical: 10),
              //       backgroundColor: Colors.white,
              //       foregroundColor: Colors.black,
              //     ),
              //     child: Text(
              //       "Add to Favourites",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: 1,
              //         fontFamily: 'Poppins',
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    shape: CircleBorder(
                        side: BorderSide(
                      color: Colors.grey,
                      width: 5,
                    )),
                  ),
                  icon: Icon(
                    widget.food.isLiked ? Iconsax.heart5 : Iconsax.heart,
                    color: widget.food.isLiked ? Colors.red : Colors.black,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.food.image),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Positioned(
                top: 40,
                left: 10,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fixedSize: const Size(50, 50),
                      ),
                      icon: const Icon(CupertinoIcons.chevron_back),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        fixedSize: const Size(50, 50),
                      ),
                      icon: const Icon(Iconsax.notification),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 177, 177, 177),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.food.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
