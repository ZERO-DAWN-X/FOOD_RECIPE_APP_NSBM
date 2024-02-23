import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const AppBarC_P = Colors.black;
const AppBarC_S = Colors.grey;

// -------------------------------------------  AppBar Text Styles  ---------------------------------------------

TextStyle appBarStyle = const TextStyle(
  fontFamily: "poppins",
  fontWeight: FontWeight.w500,
  color: AppBarC_P,
);

// -------------------------------------------  Carousel Slider Images  ---------------------------------------------

final List<String> imgList = [
  "assets/images/greenhome.png",
  "assets/images/homecover.png",
  "assets/images/greenhome.png",
  "assets/images/homecover.png",
  "assets/images/homecover.png",
];

// -------------------------------------------  Carousel Slider  ---------------------------------------------

CarouselSlider carouselSlider = CarouselSlider(
  options: CarouselOptions(
    height: 170.0,
    aspectRatio: 16 / 9,
    viewportFraction: 1.0,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 1000),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  ),
  items: imgList
      .map((item) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          ))
      .toList(),
);

// -------------------------------------------  Category Buttons Decoration  ---------------------------------------------
BoxDecoration CategoryBtnDecoration = BoxDecoration(
    color: Colors.grey[200], borderRadius: BorderRadius.circular(10));
EdgeInsets CategoryBtnPadding =
    EdgeInsets.symmetric(horizontal: 15, vertical: 7);
// -------------------------------------------    ---------------------------------------------

TextStyle CategoryBtnStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
