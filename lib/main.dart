import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/LoadingScreen.dart';
import 'package:food_recipe_app_nsbm/screens/Favourite.dart';// Import the Food class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FireBase Initialization -------------------------------------------

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBMXOk4jlmp7MIkCgDfPZut1dBh0KnOBvs",
              appId: "1:447963300313:android:5429bfd24b2d49908c99c8",
              messagingSenderId: "447963300313",
              projectId: "nsbm-food-app"))
      : await Firebase.initializeApp();

  // addFoodsToFirestore();           // Call the function to add foods to Firestore
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
