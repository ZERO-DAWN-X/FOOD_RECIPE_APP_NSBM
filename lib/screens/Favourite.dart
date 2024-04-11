import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app_nsbm/models/Chef.dart';
import 'package:food_recipe_app_nsbm/models/FoodItem.dart';
import 'package:iconsax/iconsax.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF3D00),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        height: 120,
                        width: (MediaQuery.of(context).size.width) - 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 90) /
                                        2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/banner1.png'),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      color: Color(0xffFF3D00), width: 3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(width: 25),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 80) /
                                        2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/p2.png'),
                                            radius: 12),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 3,
                                              bottom: 3,
                                            ),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              chefs[0].name.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          foods[0].name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Iconsax.trash4,
                                            size: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Iconsax.clock,
                                          color: Colors.black,
                                          size: 22,
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          "${foods[0].time} min",
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
