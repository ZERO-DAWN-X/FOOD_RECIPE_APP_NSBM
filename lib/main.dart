import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/LoadingScreen.dart';
import 'screens/HomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
      // home: HomePage(),
    );
  }
}
