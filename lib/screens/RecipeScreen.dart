import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/constants/images.dart';
import 'package:food_recipe_app_nsbm/models/food_model.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_recipe_app_nsbm/models/Chef.dart';

class RecipeScreen extends StatefulWidget {
  final Food food;
  const RecipeScreen({super.key, required this.food});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  int currentNumber = 1;
  int selectedChef = 0;
  int selectedAdd = 0;

  // Format Count (1000 = 1K Like as) -----------------------------------------------------------

  String formatCount(double count) {
    if (count >= 1000 && count < 10000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    } else if (count >= 10000) {
      return '${(count / 1000).toStringAsFixed(0)}K';
    } else {
      return count.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('foods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          List<Food> foods = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

            return Food(
              name: data['name'],
              image: data['image'],
              time: (data['time'] ?? 0).toDouble(),
              rate: (data['rate'] ?? 0).toDouble(),
              review: data['review'] ?? 0,
              isLiked: data['isLiked'] ?? false,
            );
          }).toList();

          return Scaffold(
            backgroundColor: Colors.white,

            // App Bar ---------------------------------------------------------------------------------------

            appBar: AppBar(elevation: 0, actions: [
              const Spacer(),
              IconButton(
                onPressed: () async {
                  setState(() {
                    foods[selectedChef].isLiked = !foods[selectedChef].isLiked;
                  });

                  if (foods[selectedChef].isLiked) {
                    await FirebaseFirestore.instance
                        .collection('Favorites')
                        .add({
                      'chefName': chefs[selectedChef].name,
                      'foodName': foods[selectedChef].name,
                    });
                  } else {
                    final snapshot = await FirebaseFirestore.instance
                        .collection('Favorites')
                        .where('chefName', isEqualTo: chefs[selectedChef].name)
                        .where('foodName', isEqualTo: foods[selectedChef].name)
                        .get();

                    for (final doc in snapshot.docs) {
                      await doc.reference.delete();
                    }
                  }
                  await FirebaseFirestore.instance
                      .collection('foods')
                      .doc(snapshot.data!.docs[selectedChef].id)
                      .update({
                    'isLiked': foods[selectedChef].isLiked,
                  });
                },
                icon: Icon(
                  foods[selectedChef].isLiked ? Iconsax.like5 : Iconsax.like,
                  color:
                      foods[selectedChef].isLiked ? Colors.red : Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedAdd == 0 ? selectedAdd = 1 : selectedAdd = 0;
                  });
                },
                icon: Icon(
                  selectedAdd == 0
                      ? Icons.bookmarks_outlined
                      : Icons.bookmarks_rounded,
                  color: selectedAdd == 0
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.red,
                  size: 28,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.share,
                  color: Color.fromARGB(255, 23, 71, 228),
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
            ]),

            // Bottom Navigation Bar -----------------------------------------------------------------------

            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: const Color(0xfffff3d00),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
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
                  const SizedBox(width: 10),
                ],
              ),
            ),

            // APP BODY SECTION ---------------------------------------------------------------------------------------------

            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // FOOD Item Image --------------------------------------------------------------------------------
                  Stack(
                    children: [
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 15.0, right: 15.0),
                        child: GestureDetector(
                          onVerticalDragEnd: (details) {
                            if (details.primaryVelocity! > 0) {
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            height: 230,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(widget.food.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),

                  // Image Bottom Swipe Down BAR -------------------------------------------------------------------------------

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 70,
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 177, 177, 177),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // FOOD Item Name --------------------------------------------------------------------------------

                  Text(
                    foods[currentNumber].name,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Select Your Favorite Chef",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      )),
                  const SizedBox(height: 20),

                  // CHEF Selection --------------------------------------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,

                          // CHEF Selection List GENERATE -----------------------------------------------------------------------

                          child: Row(
                            children: List.generate(
                              chefs.length,
                              (index) => GestureDetector(
                                onTap: () => setState(() {
                                  selectedChef = index;
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      // CHEF Image and Name ---------------------------------------------------------------

                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: selectedChef == index
                                            ? const Color(0xfffff3d00)
                                            : Colors.white,
                                        child: CircleAvatar(
                                          radius: 27,
                                          backgroundImage:
                                              AssetImage(chefs[index].image),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // CHEF Selected Background ---------------------------------------------------------------

                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: selectedChef == index
                                              ? const Color(0xfffff3d00)
                                              : Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 2.0,
                                              bottom: 3.0),

                                          // CHEF Name ---------------------------------------------------------------

                                          child: Text(
                                            chefs[index].name.split(' ')[0],
                                            style: TextStyle(
                                              color: selectedChef == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 8,
                                              fontFamily: 'poppins',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // CHEF Description SECTION ----------------------------------------------------------------------------------

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CHEF Description Text ---------------------------------------------------------------

                            const Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),

                            // CHEF Description Container ---------------------------------------------------------------

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    // CHEF Name / ID / FOLLOW Row ---------------------------------------------------------------
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 24,
                                              backgroundImage: AssetImage(
                                                  chefs[selectedChef].image),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10.0,
                                                              top: 2.0,
                                                              bottom: 2),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 209, 209, 209),
                                                      ),
                                                      child: Text(
                                                        chefs[selectedChef]
                                                            .name,
                                                        style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Poppins',
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Icon(
                                                      Iconsax.verify5,
                                                      size: 18,
                                                      color: Color(0xfff1877f2),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Text(
                                                      "@${chefs[selectedChef].name}",
                                                      style: const TextStyle(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Poppins',
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5),

                                        // FOLLOW Button ---------------------------------------------------------------

                                        SizedBox(
                                          width: 110,
                                          height: 30,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:!chefs[selectedChef].isFollowed? const Color(0xfffff3d00): const Color(0xff000000).withOpacity(.2),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                chefs[selectedChef].isFollowed =
                                                    !chefs[selectedChef]
                                                        .isFollowed;
                                                chefs[selectedChef].isFollowed
                                                    ? chefs[selectedChef]
                                                        .FollowersCount += 1
                                                    : chefs[selectedChef]
                                                        .FollowersCount -= 1;
                                              });
                                            },
                                            child: Text(
                                                !chefs[selectedChef].isFollowed
                                                    ? "Follow"
                                                    : "Following",
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 25),

                                    // RECIPES / FOLLOWERS / LIKES Indicate ---------------------------------------------------------------

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: SOCIALIndicate,
                                            height: 25,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 7.0,
                                                right: 7.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Recipes : ",
                                                    style: SOCIALstyle,
                                                  ),
                                                  Text(
                                                    formatCount(
                                                        chefs[selectedChef]
                                                            .RecipesCount),
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xfffff3d00)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Container(
                                            decoration: SOCIALIndicate,
                                            height: 25,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 7.0,
                                                right: 7.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Followers : ",
                                                    style: SOCIALstyle,
                                                  ),
                                                  Text(
                                                    formatCount(
                                                        chefs[selectedChef]
                                                            .FollowersCount),
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xfffff3d00),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Container(
                                            decoration: SOCIALIndicate,
                                            width: 80,
                                            height: 25,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 7.0,
                                                right: 7.0,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("Likes : ",
                                                      style: SOCIALstyle),
                                                  Text(
                                                    formatCount(
                                                        chefs[selectedChef]
                                                            .LikesCount),
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xfffff3d00),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // CHEF ABOUT (ABOUT / SOCIAL MEDIA BUTTONS)---------------------------------------------------------------

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 40),
                                        Text("About Chef", style: ChefABOUT),
                                        const SizedBox(height: 10),
                                        Text(
                                          chefs[selectedChef].description,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text("Social Media", style: ChefABOUT),
                                        const SizedBox(height: 25),
                                        Column(
                                          children: [
                                            // SOCIAL MEDIA BUTTONS ---------------------------------------------------------------

                                            Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      SocialMediaDECORATION,
                                                  child: const Icon(
                                                    Iconsax.instagram,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Follow on Instagram",
                                                  style: SocialMediaTEXT,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      SocialMediaDECORATION
                                                          .copyWith(
                                                              color: const Color(
                                                                  0xfff1877f2)),
                                                  child: const Icon(
                                                    Icons.facebook_rounded,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Follow on Facebook",
                                                  style: SocialMediaTEXT,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      SocialMediaDECORATION
                                                          .copyWith(
                                                              color: const Color(
                                                                  0xfffff3d00)),
                                                  child: const Icon(
                                                    Icons.play_arrow,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Follow on Youtube",
                                                  style: SocialMediaTEXT,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      SocialMediaDECORATION
                                                          .copyWith(
                                                              color: const Color(
                                                                  0xfff000000)),
                                                  child: const Icon(
                                                    Icons.tiktok,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Text(
                                                  "Follow on TikTok",
                                                  style: SocialMediaTEXT,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            //Cooking TIME ------------------------------------------------------------

                            Container(
                              width: 200,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xfffff3d00),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 2.0,
                                    bottom: 3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Iconsax.clock5,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                    const SizedBox(width: 5),
                                    const Text("Cook Time : ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        )),
                                    Text(
                                      "${foods[currentNumber].time} min",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            //Ingredients ------------------------------------------------------------

                            const Text(
                              "Ingredients",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 10),

                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    // Ingredients List ---------------------------------------------------------------

                                    Column(
                                      children: List.generate(
                                        foods.length,
                                        (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.radio_button_on_sharp,
                                                color: Color(0xfffff3d00),
                                                size: 15,
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                foods[currentNumber].name,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Cooking Instructions ------------------------------------------------------------

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Press ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  " START COOKING",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Color(0xfffff3d00),
                                  ),
                                ),
                                Text(
                                  " for Cooking Instructions.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
