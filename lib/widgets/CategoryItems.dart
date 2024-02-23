import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/Test.dart';
import 'package:food_recipe_app_nsbm/widgets/CategoryButtons.dart';
import 'package:food_recipe_app_nsbm/widgets/FoodItemRow.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'aqz-KE-bpKQ',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        loop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Food Resipes",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "View All",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Tabscreens[0],
        ),
        SizedBox(height: 25),

        // Video Player -----------------------------------------------
        Container(
          width: 400,
          height: 250,
          child: YoutubePlayer(
            controller: _controller,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
