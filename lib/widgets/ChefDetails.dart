import 'package:flutter/material.dart';
import '../models/Chef.dart';

class ChefDetails extends StatefulWidget {
  final List<Chef> chefs;
  const ChefDetails({super.key, required this.chefs});

  @override
  State<ChefDetails> createState() => _ChefDetailsState();
}

class _ChefDetailsState extends State<ChefDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Description"),
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.chefs[0].image),
                ),
              ],
            ),
            Row(),
            Column(),
          ],
        ),
      ],
    );
  }
}