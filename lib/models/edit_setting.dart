import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe_app_nsbm/screens/authentication/SignUpPage.dart';
import 'package:flutter/material.dart';

class EditAccountSetting extends StatefulWidget {
  const EditAccountSetting({super.key});

  @override
  State<EditAccountSetting> createState() => _EditAccountSettingState();
}

class _EditAccountSettingState extends State<EditAccountSetting> {
//crurrent user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50, ),

              //image user
                Image.asset(
                    'assets/images/p3.png',
                    width: 60,
                    height: 100,
                  ),

                  const SizedBox(height: 16,),

                 //user email
                 Text(currentUser.email!,
                  textAlign: TextAlign.center,
                 style: TextStyle(color: Colors.grey[700]),
                 ),

                 const SizedBox(height: 40,),
                  
                  //user details
                 Padding(padding: co)
          ],
        ));
  }
}
