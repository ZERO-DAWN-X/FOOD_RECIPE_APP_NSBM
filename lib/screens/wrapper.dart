import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/UserModel.dart';
import 'Home.dart';
import 'authentication/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    // print(user);

    if(user == null){
      return Authenticate();
    }
    else{
      return const Home();
    }
  }
}