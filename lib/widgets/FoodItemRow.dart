import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/food_model.dart';
import 'package:food_recipe_app_nsbm/screens/RecipeScreen.dart';
import 'package:iconsax/iconsax.dart';

class FoodItemRow extends StatefulWidget {
  final List<Food> foods;
  const FoodItemRow({super.key, required this.foods});

  @override
  State<FoodItemRow> createState() => _FoodItemRowState();
}

class _FoodItemRowState extends State<FoodItemRow> {
  bool ignore = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('foods').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return CircularProgressIndicator();
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

        return Row(
          children: List.generate(
            foods.length,
            (index) => GestureDetector(
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => RecipeScreen(food: widget.foods[index]),
              //   ),
              // ),
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 260,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(foods[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          foods[index].name,
                          style: foodStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.only(left: 1, right: 1),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.clock,
                                      color: Colors.grey,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 7),
                                    Text("${foods[index].time} min",
                                        style: foodStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.medal_star5,
                                      color: Color.fromARGB(255, 24, 141, 20),
                                      size: 17,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                        "${foods[index].rate} (${foods[index].review} reviews)",
                                        style: foodStyle.copyWith(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                    // ---------------------- Update the Firestore data when the like button is pressed ---------------------------

                    //( This Code have some bugs in Earlier, When I press the button multiple times quickly, the state might not be updated before the next increment or decrement. Then result in a double increment or decrement. Now Its FIXED :)

                    Positioned(
                      top: 1,
                      right: 1,
                      child: IgnorePointer(
                        ignoring: ignore, // ignore button presses when updating
                        child: IconButton(
                          onPressed: () async {
                            if (!ignore) {
                              try {
                                setState(() {
                                  ignore = true; // disable button
                                });

                                // Update Firestore data
                                await FirebaseFirestore.instance
                                    .collection('foods')
                                    .doc(snapshot.data!.docs[index].id)
                                    .update({
                                  'isLiked': !foods[index].isLiked,
                                  'review': FieldValue.increment(
                                      foods[index].isLiked ? -1 : 1),
                                });

                                // Update local state after Firestore update
                                setState(() {
                                  foods[index].isLiked = !foods[index].isLiked;
                                });
                              } catch (e) {
                                print('Error updating like status: $e');
                              } finally {
                                setState(() {
                                  ignore = false; // enable the button
                                });
                              }
                            }
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(18, 18),
                          ),
                          iconSize: 15,
                          icon: Icon(
                            foods[index].isLiked
                                ? Iconsax.heart5
                                : Iconsax.heart,
                            color: foods[index].isLiked
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
