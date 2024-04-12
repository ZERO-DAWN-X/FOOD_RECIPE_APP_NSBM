import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 411,
          height: 825,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 411,
                  height: 321,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(135)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 365,
                child: Container(
                  width: 273,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -3,
                top: 439,
                child: Container(
                  width: 273,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 1,
                top: 513,
                child: Container(
                  width: 273,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 587,
                child: Container(
                  width: 273,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 661,
                child: Container(
                  width: 273,
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF3D00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 88,
                top: 600,
                child: Text(
                  'Info',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 88,
                top: 378,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 54,
                top: 287,
                child: Text(
                  'praveenkavindu@gmail.com',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 87,
                top: 452,
                child: Text(
                  'Contact Us',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 88,
                top: 526,
                child: Text(
                  'Donate',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 88,
                top: 673,
                child: Text(
                  'About US',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 379,
                child: Container(
                  width: 26,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 3.27,
                        top: 2.71,
                        child: Container(
                          width: 19.46,
                          height: 20.58,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 26,
                child: Container(
                  width: 41,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 37,
                child: Container(
                  width: 18,
                  height: 18,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  
                ),
              ),
              Positioned(
                left: 129,
                top: 193,
                child: Container(
                  width: 154,
                  height: 23,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 194,
                child: SizedBox(
                  width: 120,
                  height: 16,
                  child: Text(
                    'RAVINDU BANDARI',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 157,
                top: 85,
                child: Container(
                  width: 98,
                  height: 98,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/98x98"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 19,
                top: 286,
                child: Container(
                  width: 20,
                  height: 20,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 1.67,
                        top: 3.33,
                        child: Container(
                          width: 16.67,
                          height: 13.33,
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 37,
                top: 452,
                child: Container(
                  width: 26,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  
                ),
              ),
              Positioned(
                left: 37,
                top: 524,
                child: Container(
                  width: 26,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  
                ),
              ),
              Positioned(
                left: 37,
                top: 600,
                child: Container(
                  width: 26,
                  height: 26,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}