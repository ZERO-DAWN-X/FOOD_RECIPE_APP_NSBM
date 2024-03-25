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
  "assets/images/b1.png",
  "assets/images/banner4.png",
  "assets/images/banner1.png",
  "assets/images/banner2.png",
  "assets/images/banner3.png",
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
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 1000),
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
    const EdgeInsets.symmetric(horizontal: 15, vertical: 7);
// -------------------------------------------    ---------------------------------------------

TextStyle CategoryBtnStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

// -------------------------------------------  Category Buttons Sectors  ---------------------------------------------

Container Sector = Container(
  decoration: boxDecoration,
  height: 170,
  width: 280,
);

BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  image: const DecorationImage(
    image: AssetImage("assets/images/1.png"),
    fit: BoxFit.cover,
  ),
);

//---------------------

