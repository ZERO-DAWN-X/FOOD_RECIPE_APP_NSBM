import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/Favourite.dart';
import 'package:food_recipe_app_nsbm/screens/Home.dart';
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
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF3D00),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 9, left: 10, right: 10),
        child: GNav(
          backgroundColor: const Color(0xffFF3D00),
          activeColor: const Color(0xffFF3D00),
          color: Colors.white,
          tabBackgroundColor: Colors.white,
          gap: 8,
          iconSize: 25,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
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
