import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/TopRecipes.dart';
import 'package:food_recipe_app_nsbm/widgets/CategoryButtons.dart';
import 'package:food_recipe_app_nsbm/widgets/HomeSearchBar.dart';
import 'package:food_recipe_app_nsbm/widgets/Top_Recipes.dart';
import '../widgets/CategoryItems.dart';
import '../widgets/HomeAppbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_recipe_app_nsbm/constans.dart';

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
          padding: EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppbar(),
                SizedBox(height: 20),
                HomeSearchBar(),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 170.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Top Recipes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TopRecipes(
                  topStatus: Status,
                ),
                SizedBox(height: 20),
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                CategoryButtons(),
                SizedBox(height: 20),
                // CategoryItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
