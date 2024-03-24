import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app_nsbm/constants/images.dart';
import 'package:food_recipe_app_nsbm/models/FoodItem.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, actions: [
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            widget.food.isLiked ? Iconsax.heart5 : Iconsax.heart,
            color: widget.food.isLiked ? Colors.red : Colors.black,
            size: 28,
          ),
        ),
        SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            size: 28,
            Iconsax.save_add,
          ),
        ),
        SizedBox(width: 20),
      ]),
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
                    backgroundColor: Color(0xfffFF3D00),
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
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 70,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 177, 177, 177),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.food.name,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 30),
            const Text("Select Your Favourite Chef",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: selectedChef == index
                                      ? Color(0xfffFF3D00)
                                      : Color.fromARGB(255, 255, 255, 255),
                                  child: CircleAvatar(
                                    radius: 27,
                                    backgroundImage:
                                        AssetImage(chefs[index].image),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: selectedChef == index
                                        ? Color(0xfffFF3D00)
                                        : Color.fromARGB(255, 223, 223, 223),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                        top: 2.0,
                                        bottom: 3.0),
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

                  //Description ----------------------------------------------------------------------------------

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: AssetImage(
                                              chefs[selectedChef].image),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.0,
                                                      right: 10.0,
                                                      top: 2.0,
                                                      bottom: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color: Color.fromARGB(
                                                        255, 209, 209, 209),
                                                  ),
                                                  child: Text(
                                                    chefs[selectedChef].name,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                  Iconsax.verify5,
                                                  size: 18,
                                                  color: Color(0xfff1877F2),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                  "@" +
                                                      chefs[selectedChef].name,
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Poppins',
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xfffFF3D00),
                                      ),
                                      onPressed: () {},
                                      child: Text("FOLLOW",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.black,
                                      ),
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
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              formatCount(chefs[selectedChef]
                                                  .RecipesCount),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xfffFF3D00)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.black,
                                      ),
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
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              formatCount(chefs[selectedChef]
                                                  .FollowersCount),
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xfffFF3D00),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.black,
                                      ),
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
                                            Text(
                                              "Likes : ",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              formatCount(chefs[selectedChef]
                                                  .LikesCount),
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xfffFF3D00),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 40),
                                  Text(
                                    "About Chef",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    chefs[selectedChef].description,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Social Media",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: SocialMediaDECORATION,
                                            child: Icon(
                                              Iconsax.instagram,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "Follow on Instagram",
                                            style: SocialMediaTEXT,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration:
                                                SocialMediaDECORATION.copyWith(
                                                    color: Color(0xfff1877F2)),
                                            child: Icon(
                                              Icons.facebook_rounded,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "Follow on Facebook",
                                            style: SocialMediaTEXT,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration:
                                                SocialMediaDECORATION.copyWith(
                                                    color: Color(0xfffFF3D00)),
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "Follow on Youtube",
                                            style: SocialMediaTEXT,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration:
                                                SocialMediaDECORATION.copyWith(
                                                    color: Color(0xfff000000)),
                                            child: Icon(
                                              Icons.tiktok,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "Follow on TikTok",
                                            style: SocialMediaTEXT,
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //Cooking TIME ------------------------------------------------------------
                      Container(
                        width: 200,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xfffFF3D00),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 2.0, bottom: 3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.clock5,
                                color: Colors.white,
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text("Cook Time : ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  )),
                              Text(
                                "${widget.food.time} min",
                                style: TextStyle(
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
                      SizedBox(height: 20),

                      //Ingredients ------------------------------------------------------------
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Column(
                                children: List.generate(
                                  foods.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.radio_button_on_sharp,
                                          color: Color(0xfffFF3D00),
                                          size: 15,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          widget.food.name[index],
                                          style: TextStyle(
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
                      SizedBox(height: 20),

                      Row(
                        children: [
                          Text(
                            "Press ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            " START COOKING",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Color(0xfffFF3D00),
                            ),
                          ),
                          Text(
                            " for Cooking Instructions.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xfffFF3D00),
                            ),
                            child: Icon(
                              Iconsax.play,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
