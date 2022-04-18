// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FruitDetails{
  String? name;
  String? description;
  int? calorie;
  String? imageUrl;

  FruitDetails({this.name, this.description, this.calorie, this.imageUrl});
}

class Fruitpage extends StatelessWidget {
  const Fruitpage({Key? key, this.details}) : super(key: key);

  final Map? details;
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 85,
              ),
              ClipRRect(
                child: Image.network(
                  '${details?['imageUrl']}',
                  height: 256,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: ListTile(
                  title: Text(
                    capitalize(details?['name']),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        color: Colors.green),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      final player = AudioCache();
                      player.play("appvoice.mp3");
                    },
                    child: Icon(
                      Icons.volume_up_rounded,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Text(
                      "Calorie:",
                      style: TextStyle(
                          color: Colors.green,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${details?['calorie']} cal',
                      style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 1,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18),
              //   child: Row(
              //     children: [
              //       Text(
              //         "Sources:",
              //         style: TextStyle(
              //             color: Colors.green,
              //             fontFamily: 'Poppins',
              //             letterSpacing: 1,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 25),
              //       ),
              //       SizedBox(
              //         width: 22,
              //       ),
              //       Text(
              //         "Tree",
              //         style: TextStyle(
              //             color: Colors.grey[600],
              //             letterSpacing: 1,
              //             fontFamily: 'Poppins',
              //             fontSize: 25),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "About ${capitalize(details?['name'])}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.green,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  '${details?['description']}',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                      height: 1.4,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "Fun Facts",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.blue,
                      fontSize: 25),
                ),
              ),
              BulletedList(
                listItems: [
                  "Apple trees are 4 or 5 years old before they actually have apples.",
                  "Apple are a member of the rose family.",
                  "China grows more apples than any other country in the world.",
                  "It takes about 36 apples to make 1 gallon of apple cider.",
                  "Apple trees can live to be about 100 years old.",
                ],
                style: TextStyle(
                  fontSize: 16,
                ),
                bullet: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
