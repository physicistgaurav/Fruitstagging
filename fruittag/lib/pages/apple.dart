// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Applepage extends StatelessWidget {
  const Applepage({Key? key}) : super(key: key);

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
                child: Image(
                  image: AssetImage("assets/apple1.jpg"),
                  height: 360,
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
                    "Apple",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        color: Colors.grey[800]),
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
                          color: Colors.grey[600],
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "52 cal",
                      style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 1,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Text(
                      "Sources:",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontFamily: 'Poppins',
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Text(
                      "Tree",
                      style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 1,
                          fontFamily: 'Poppins',
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "About Apple",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.grey[800],
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Text(
                  "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition. ",
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                      height: 1.4,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
