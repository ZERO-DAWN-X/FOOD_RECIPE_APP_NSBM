import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/constants.dart';
import 'package:food_recipe_app_nsbm/screens/Home.dart';
import 'package:iconsax/iconsax.dart';

class HomeTEST_01 extends StatefulWidget {
  const HomeTEST_01({super.key});

  @override
  State<HomeTEST_01> createState() => _HomeTEST_01State();
}

class _HomeTEST_01State extends State<HomeTEST_01> {
  int selectedTab = 0;
  List screens = [
    const Home(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                selectedTab = 0;
              }),
              child: Column(
                children: [
                  Icon(
                    selectedTab == 0 ? Iconsax.home5 : Iconsax.home_1,
                    color: selectedTab == 0 ? AppBarC_P : AppBarC_S,
                  ),
                  Text('Home',
                      style: appBarStyle.copyWith(
                          color: selectedTab == 0 ? AppBarC_P : AppBarC_S)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedTab = 1;
              }),
              child: Column(
                children: [
                  Icon(
                    selectedTab == 1 ? Iconsax.calendar_25 : Iconsax.calendar_2,
                    color: selectedTab == 1 ? AppBarC_P : AppBarC_S,
                  ),
                  Text(
                    'Meal Plan',
                    style: appBarStyle.copyWith(
                        color: selectedTab == 1 ? AppBarC_P : AppBarC_S),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedTab = 2;
              }),
              child: Column(
                children: [
                  Icon(
                    selectedTab == 2 ? Iconsax.additem5 : Iconsax.additem,
                    color: selectedTab == 2 ? AppBarC_P : AppBarC_S,
                  ),
                  Text(
                    'Add',
                    style: appBarStyle.copyWith(
                        color: selectedTab == 2 ? AppBarC_P : AppBarC_S),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedTab = 3;
              }),
              child: Column(
                children: [
                  Icon(
                    selectedTab == 3 ? Iconsax.heart5 : Iconsax.heart,
                    color: selectedTab == 3 ? AppBarC_P : AppBarC_S,
                  ),
                  Text(
                    'Favorite',
                    style: appBarStyle.copyWith(
                        color: selectedTab == 3 ? AppBarC_P : AppBarC_S),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                selectedTab = 4;
              }),
              child: Column(
                children: [
                  Icon(
                    selectedTab == 4 ? Iconsax.setting4 : Iconsax.setting_2,
                    color: selectedTab == 4 ? AppBarC_P : AppBarC_S,
                  ),
                  Text(
                    'Settings',
                    style: appBarStyle.copyWith(
                        color: selectedTab == 4 ? AppBarC_P : AppBarC_S),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: screens[selectedTab],
    );
  }
}
