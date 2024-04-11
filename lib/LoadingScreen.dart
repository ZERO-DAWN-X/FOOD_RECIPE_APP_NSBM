import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/mainLOG.dart';

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
            Container(
              // ignore: use_full_hex_values_for_flutter_colors
              decoration: const BoxDecoration(color: Color(0xfffff3d00)
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/L2.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimatedSplashScreen(
                            splash: "assets/images/LG.png",
                            duration: 1000,
                            nextScreen: const MainLog(),
                            splashIconSize: MediaQuery.of(context).size.width *
                                0.18, // adjust the size of the splash icon here
                            splashTransition: SplashTransition.fadeTransition,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
