import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/TopRecipes.dart';

class TopRecipes extends StatefulWidget {
  final List<TopStatus> topStatus;
  const TopRecipes({super.key, required this.topStatus});

  @override
  State<TopRecipes> createState() => _TopRecipesState();
}

class _TopRecipesState extends State<TopRecipes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.topStatus.length,
          (index) => GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 7),
              width: 115,
              height: 185,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.topStatus[index].image),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.topStatus[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Image.asset(widget.topStatus[index].profile,
                                    width: 11, height: 11),
                                SizedBox(width: 5),
                                Text(widget.topStatus[index].chef,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
