import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/HomePage.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSplashScreen(
            splash: "assets/images/Green.png",
            duration: 30000,
            splashIconSize: 300.0,
            nextScreen: HomePage(),
            splashTransition: SplashTransition.fadeTransition,
          )
        ],
      )),
    );
  }
}
