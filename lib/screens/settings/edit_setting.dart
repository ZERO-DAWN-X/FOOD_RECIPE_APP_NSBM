import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:food_recipe_app_nsbm/screens/authentication/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/settings/my_textbox.dart';

class EditAccountSetting extends StatefulWidget {
  const EditAccountSetting({super.key});

  @override
  State<EditAccountSetting> createState() => _EditAccountSettingState();
}

class _EditAccountSettingState extends State<EditAccountSetting> {
//crurrent user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //all users
  //final UserCollection = FirebaseFirestore.instance.collection('Users');

  //edit text field
  Future<void> editfield(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Enter new $field",
              hintStyle: TextStyle(color: Colors.grey)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          //cancel button
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          //save button
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    //update in firebase
   // if (newValue.trim().length > 0) {
      //only update if there something in textfield
      //await UserCollection.doc(currentUser.email).update({field: newValue});
   // }
  }

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
            height: 50,
          ),

          //image user
          Image.asset(
            'assets/images/p3.png',
            width: 60,
            height: 100,
          ),

          const SizedBox(
            height: 16,
          ),

          //user email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),

          const SizedBox(
            height: 40,
          ),

          //user details
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'My details',
              style: TextStyle(color: Colors.grey[700],
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
          ),

          //user name
          MyTextBox(
            text: 'hello1',
            sectionName: 'username',
            onPressed: () => editfield('username'),
          ),

          const SizedBox(
            height: 10,
          ),

          //bio
          MyTextBox(
            text: 'bio',
            sectionName: 'bio',
            onPressed: () => editfield('bio'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
