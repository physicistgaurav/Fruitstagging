// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage("assets/newsplash.png")),
            ),
          ),
          Text(
            "FruiTag",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'RubikGlitch'),
          ),
          Text(
            "Tagafruit@gmail.com",
            style: TextStyle(
                color: Colors.grey[200], fontSize: 14, fontFamily: 'yono'),
          ),
        ],
      ),
    );
  }
}
