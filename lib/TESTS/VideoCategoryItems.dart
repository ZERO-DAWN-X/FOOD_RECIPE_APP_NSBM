import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// get CategoryButtons.dart selectedBtn value and assign it to Tabscreens[selectedBtn]

class VideoCategoryItems extends StatefulWidget {
  const VideoCategoryItems({super.key});

  @override
  State<VideoCategoryItems> createState() => _VideoCategoryItemsState();
}

class _VideoCategoryItemsState extends State<VideoCategoryItems> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'aqz-KE-bpKQ',
      flags: const YoutubePlayerFlags(
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
        const SizedBox(height: 20),

        // Video Player -----------------------------------------------
        SizedBox(
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
