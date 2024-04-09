import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/TopRecipes.dart';
import 'package:food_recipe_app_nsbm/widgets/CategoryButtons.dart';
import 'package:food_recipe_app_nsbm/widgets/HomeSearchBar.dart';
import 'package:food_recipe_app_nsbm/widgets/Top_Recipes.dart';
import '../widgets/HomeAppbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_recipe_app_nsbm/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            // Column for the whole body of home page -------------------------------------------

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(height: 20),
                const HomeSearchBar(),
                const SizedBox(height: 20),

                // Carousel Slider --------------------------------------------

                CarouselSlider(
                  options: CarouselOptions(
                    height: 170.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imgList
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Top Recipes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Top Recipes List View ---------------------------------------

                TopRecipes(topStatus: Status),
                const SizedBox(height: 20),

                // Categories --------------------------------------------

                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Category Buttons --------------------------------------------

                const CategoryButtons(),

                const SizedBox(height: 20),
                // CategoryItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
