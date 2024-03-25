import 'package:flutter/material.dart';

DecorationImage bgImage = DecorationImage(
  image: const AssetImage("assets/images/3.jpg"),
  fit: BoxFit.cover,
  colorFilter: ColorFilter.mode(
      const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5), BlendMode.darken),
);

const InputDecoration textField_Decoration = InputDecoration(
  contentPadding: EdgeInsets.all(15),
  hintText: "Enter email",
  hintStyle: TextStyle(
      color: Color.fromRGBO(179, 179, 179, 1),
      fontFamily: 'roboto',
      fontSize: 13),
  // labelText: "Email",
  fillColor: Color.fromARGB(255, 255, 255, 255),
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 202, 202, 202)),
      borderRadius: BorderRadius.all(Radius.circular(100))
      // borderRadius: BorderRadius.all(Radius.circular(100))
      ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xfffff3d00)),
      borderRadius: BorderRadius.all(Radius.circular(100))),
);

GestureDetector SocialIcon = GestureDetector(
  onTap: () {},
  child: Image.asset(
    "assets/images/google.png",
    height: 43,
  ),
);

BoxDecoration LogBtn = BoxDecoration(
  color: const Color(0xfffff3d00),
  borderRadius: BorderRadius.circular(100),
);

TextStyle LogBtnStyle = const TextStyle(
    fontFamily: "poppins",
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white);

// -------------------------------------------  Social Media Styles  ---------------------------------------------

BoxDecoration SocialMediaDECORATION = BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: const Color.fromARGB(255, 252, 34, 136),
);

TextStyle SocialMediaTEXT = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w600,
  fontFamily: 'Poppins',
  color: Color(0xfffFF3D00),
);

BoxDecoration SOCIALIndicate = BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: Colors.black,
);

TextStyle SOCIALstyle = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  color: Colors.white,
);

TextStyle ChefABOUT = const TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);
