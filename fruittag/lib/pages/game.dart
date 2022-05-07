// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fruittag/games/data/questions_list.dart';
import 'package:fruittag/pages/game_result.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameHomePage(),
    );
  }
}

class GameHomePage extends StatefulWidget {
  const GameHomePage({Key? key}) : super(key: key);

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  Color mainColor = Color.fromRGBO(245, 245, 245, 1);
  Color secondColor = Color(0xFF117eeb);
  // Page Controller
  final PageController? _controller = PageController(initialPage: 0);
  // Game vairable
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1} /${questions.length}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 28),
                    ),
                  ),
                  const Divider(
                    color: Color.fromRGBO(165, 214, 167, 1),
                    height: 8,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Questions
                  Text(
                    questions[index].question!,
                    style: const TextStyle(color: Colors.black, fontSize: 28),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  // Buttons for answers
                  for (int i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 18),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : secondColor,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  print(score);
                                }
                              },
                        child: Text(
                          questions[index].answer!.keys.toList()[i],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(score)));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.green, width: 1),
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "See Result"
                              : "Next Question",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
