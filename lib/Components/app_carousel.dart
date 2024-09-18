// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class AppCarousel extends StatelessWidget {
//   const AppCarousel({super.key, this.height, required this.itemBuilder, required this.itemCount });
//   final double? height;
//   final  Widget Function(BuildContext, int, int)? itemBuilder;
//   final int? itemCount;
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//         itemCount: itemCount,
//         itemBuilder: itemBuilder,
//
//
//         options: CarouselOptions(
//         height: height,
//           aspectRatio: 16/9,
//           viewportFraction: 1.0,
//           initialPage: 0,
//           enableInfiniteScroll: true,
//           reverse: false,
//           autoPlay: true,
//           autoPlayInterval: const Duration(seconds: 4),
//           autoPlayAnimationDuration: const Duration(milliseconds: 800),
//           autoPlayCurve: Curves.fastOutSlowIn,
//           scrollDirection: Axis.horizontal,
//     ),
//     );
//   }
// }
