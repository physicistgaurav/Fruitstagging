// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruittag/pages/apple.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Applepage()));
          },
          child: Image.asset(
            "assets/apple.jpeg",
            height: 30,
            width: 30,
          ),
        ),
        Image.asset(
          "assets/banana.png",
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/mango.png",
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/orange.webp",
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/pine.jpg",
          fit: BoxFit.cover,
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/cherry.jpg",
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/profbg.jpg",
          fit: BoxFit.cover,
          height: 30,
          width: 30,
        ),
        Image.asset(
          "assets/prof.jpg",
          height: 30,
          width: 30,
        ),
      ],
    );
  }
}
