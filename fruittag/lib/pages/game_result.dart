// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fruittag/pages/game.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color.fromRGBO(245, 245, 245, 1);
    Color secondColor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Congratulations!!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Score is",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${widget.score}",
              style: TextStyle(
                  color: Colors.red, fontSize: 80, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameHomePage()));
              },
              elevation: 0,
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                "Repeat the Quiz",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
