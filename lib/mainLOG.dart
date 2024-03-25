import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/UserModel.dart';
import 'services/auth.dart';

// Firebase Initialization -------------------------------------------

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?

  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyBMXOk4jlmp7MIkCgDfPZut1dBh0KnOBvs",
      appId: "1:447963300313:android:5429bfd24b2d49908c99c8",
      messagingSenderId: "447963300313",
      projectId: "nsbm-food-app"
      )
  )

  :await Firebase.initializeApp();
  runApp(const MainLog());
}

class MainLog extends StatelessWidget {
  const MainLog({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamProvider<UserModel?>.value (initialData: UserModel(uid: ""),
    value: AuthServices().user,

    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrapper(),
      ),
    ),
    );
}}