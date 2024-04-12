import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/Favourite.dart';
import 'package:food_recipe_app_nsbm/screens/Home.dart';
import 'package:food_recipe_app_nsbm/screens/Settings.dart';
import 'package:food_recipe_app_nsbm/screens/Shop.dart';


import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  List screens = [
    const Home(),
    Container(color: Colors.green),
    const Favorite(),
    FoodIngredientsBuyPage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 9, left: 10, right: 10),
        child: GNav(
          backgroundColor: Colors.white,
          activeColor: Color.fromARGB(255, 255, 255, 255),
          color: const Color(0xffFF3D00),
          tabBackgroundColor: const Color(0xffFF3D00),
          gap: 8,
          iconSize: 25,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
          tabs: const [
            GButton(icon: Iconsax.home, text: 'Home'),
            GButton(icon: Iconsax.calendar, text: 'Meal Plan'),
            GButton(icon: Iconsax.heart5, text: 'Favorite'),
            GButton(icon: Iconsax.shopping_bag, text: 'Shop'),
            GButton(icon: Iconsax.setting_2, text: 'Settings'),
          ],
          selectedIndex: 0,
          onTabChange: (index) {
            setState(() {
              page = index;
            });
          },
        ),
      ),
      body: screens[page],
    );
  }
}
