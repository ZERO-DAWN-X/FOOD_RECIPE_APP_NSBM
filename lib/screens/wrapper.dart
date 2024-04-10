import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/HomePage.dart';
import 'package:provider/provider.dart';
import '../models/UserModel.dart';
import 'authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    // print(user);

    if (user != null) {
      return const Authenticate();
    } else {
      return const HomePage();
    }
  }
}
