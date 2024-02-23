import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("What are you\ncooking today ?",
            style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.bold,
              fontSize: 35,
              height: 1,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {},
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.grey[200],
            fixedSize: const Size(50, 50),
          ),
          icon: const Icon(Iconsax.notification, color: Colors.black),
        )
      ],
    );
  }
}
