import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/screens/authentication/SignInPage.dart';
import 'package:food_recipe_app_nsbm/screens/authentication/SignUpPage.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool signinpage = true;

  //toggle pages
  void swichPages(){
    setState(() {
      signinpage = !signinpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinpage == true) {
      return SignInPage(toggleView: swichPages);
    } else {
      return SignUpPage(toggleView: swichPages);
      
    }
  }
}