// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruittag/pages/mail_msg.dart';
import 'package:animated_button/animated_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height / 2.7,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/profbg.jpg"),
                ),
                Positioned(
                  bottom: -60,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/splashimage.png",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            ListTile(
              title: Center(child: Text("FruiTag")),
              subtitle: Center(child: Text("Fruits Tagging App")),
            ),
            AnimatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactPage()));
              },
              shadowDegree: ShadowDegree.light,
              width: 120,
              height: 50,
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Mail us",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'About us',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              subtitle: Text(
                'FruiTag is an mobile application designed to tag an image.This project was designed by Gaurav Rizal, Manish Baral, Prashanna Mani Paudel and Aditi Baral under the supervision of Mr. Satyandra Nath Lohani and Mr. Dhiraj Shrestha. Currently we provide 36 different fruits which you can explore.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
