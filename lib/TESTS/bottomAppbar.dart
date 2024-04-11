import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomepageTEST extends StatefulWidget {
  const HomepageTEST({super.key});

  @override
  State<HomepageTEST> createState() => _HomepageTESTState();
}

class _HomepageTESTState extends State<HomepageTEST> {
  int page = 0;

  List screens = [
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.green,
          color: Colors.green,
          items: const <Widget>[
            Icon(Icons.home, size: 26,color: Colors.white),
            Icon(Icons.home, size: 26,color: Colors.white),
            Icon(Icons.home, size: 26,color: Colors.white),
            Icon(Icons.home, size: 26,color: Colors.white),
            Icon(Icons.home, size: 26,color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              page = index;
            });
          },
        ),
      ),
      body: screens[page],
    );
  }
}
