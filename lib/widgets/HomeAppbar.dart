import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/services/auth.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  //Create a obj fro AuthService
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("What are you\ncooking today ?",
            style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.w700,
              fontSize: 30,
              height: 1,
            )),
        const Spacer(),

        // ElevatedButton(
        //   onPressed: () async{
        //    await _auth.signOut();
        //   },
        //   child: const Icon(Icons.logout),
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Color.fromARGB(255, 204, 204, 204),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     fixedSize: const Size(50, 50),
        //   ),
        //   )

        IconButton(
          onPressed: () async {
            await _auth.signOut();
          },
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.grey[200],
            fixedSize: const Size(50, 50),
          ),
          icon: const Icon(Iconsax.logout_1, color: Colors.black),
        )
      ],
    );
  }
}
