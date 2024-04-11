import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomepageTEST extends StatefulWidget {
  const HomepageTEST({Key? key}) : super(key: key);

  @override
  State<HomepageTEST> createState() => _HomepageTESTState();
}

class _HomepageTESTState extends State<HomepageTEST> {
  int page = 0;

  List<Widget> screens = [
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Changed to a light grey background
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.green,
        color: Colors.green,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        animationCurve:
            Curves.easeInOut, // Added animation curve for smoother transition
        animationDuration: Duration(
            milliseconds:
                300), // Reduced animation duration for faster transition
      ),
      body: screens[page],
    );
  }
}
