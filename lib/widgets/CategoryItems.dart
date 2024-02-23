import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/Test.dart';
import 'package:food_recipe_app_nsbm/widgets/CategoryButtons.dart';
import 'package:food_recipe_app_nsbm/widgets/FoodItemRow.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// get CategoryButtons.dart selectedBtn value and assign it to Tabscreens[selectedBtn]

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
        SizedBox(height: 20),

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
