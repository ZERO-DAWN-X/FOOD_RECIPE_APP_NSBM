import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app_nsbm/models/food_model.dart';
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
      backgroundColor: const Color(0xffFF3D00),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Favorites').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              List<FavoriteChef> favChef = snapshot.data!.docs.map((doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

                return FavoriteChef(
                  chefName: data['chef_Name'],
                  foodName: data['food_Name'],
                  foodImage: data['food_Image'],
                  chefImage: data['chef_Image'],
                  cookTime: data['cook_Time'],
                );
              }).toList();

              return Column(
                children: [
                  Expanded(
                    child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          children: favChef.map((chef) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) async {
                                // ------------------- Delete food tile from Firestore in swipe -------------------
                                await FirebaseFirestore.instance
                                    .collection('Favorites')
                                    .where('chef_Name',
                                        isEqualTo: chef.chefName)
                                    .where('food_Name',
                                        isEqualTo: chef.foodName)
                                    .where('cook_Time',
                                        isEqualTo: chef.cookTime)
                                    .get()
                                    .then((snapshot) {
                                  for (final doc in snapshot.docs) {
                                    doc.reference.delete();
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 100,
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          // ------------------------ Food Image -----------------------
                                          Container(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    90) /
                                                2,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    AssetImage(chef.foodImage),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                color: const Color(0xffFF3D00),
                                                width: 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          // ------------------------ 2 Container Space -----------------------
                                          const SizedBox(width: 20),

                                          // ------------------------ Chef Name, Food Name, Cook Time -----------------------
                                          // ------------------------ Food Details -----------------------
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    // ------------- Chef Image -------------------
                                                    CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                              chef.chefImage),
                                                      radius: 10,
                                                    ),
                                                    const SizedBox(width: 10),

                                                    // ----------------- Chef Name ---------------------
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 10,
                                                          vertical: 2,
                                                        ),
                                                        child: Text(
                                                          chef.chefName
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 8,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // --------------- Food Name -----------------
                                                Row(
                                                  children: [
                                                    Text(
                                                      chef.foodName,
                                                      style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // ------------------ Cook Time -------------------
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Iconsax.clock,
                                                      color: Colors.black,
                                                      size: 19,
                                                    ),
                                                    const SizedBox(width: 15),
                                                    Text(
                                                      "${chef.cookTime} min",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ----------------- Delete Icon ----------------------
                                    Positioned(
                                      top: (100 - 45) / 2,
                                      right: 1,
                                      child: IconButton(
                                        onPressed: () async {
                                          // ----------------- Delete food tile from Firestore ----------------------
                                          await FirebaseFirestore.instance
                                              .collection('Favorites')
                                              .where('chef_Name',
                                                  isEqualTo: chef.chefName)
                                              .where('food_Name',
                                                  isEqualTo: chef.foodName)
                                              .where('cook_Time',
                                                  isEqualTo: chef.cookTime)
                                              .get()
                                              .then((snapshot) {
                                            for (final doc in snapshot.docs) {
                                              doc.reference.delete();
                                            }
                                          });
                                        },
                                        icon: const Icon(
                                          Iconsax.trash4,
                                          size: 23,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
