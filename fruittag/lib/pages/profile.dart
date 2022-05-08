// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:fruittag/pages/mail_msg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                ],
              ),
              SizedBox(
                height: 45,
              ),
              ListTile(
                title: Center(
                    child: Text(
                  "FruiTag",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                )),
                subtitle: Center(
                    child: Text(
                  "Fruits Tagging App",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                )),
              ),
              AnimatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactPage()));
                },
                shadowDegree: ShadowDegree.light,
                width: 120,
                height: 50,
                color: Color.fromRGBO(14, 167, 129, 1),
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
              // ElevatedButton.icon(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => ContactPage()));
              //   },
              //   icon: Icon(
              //     Icons.mail,
              //     color: Colors.white,
              //     size: 20,
              //   ),
              //   label: Text(
              //     'Mail us',
              //   ),
              //   style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8)),
              //       primary: Color.fromRGBO(14, 167, 129, 1),
              //       fixedSize: Size(120, 40)),
              // ),
              ListTile(
                title: Center(
                    child: Text(
                  "FruiTag",
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w800),
                )),
                subtitle: Center(
                    child: Text(
                  "Fruits Tagging App",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => ContactPage()));
              //   },
              //   icon: Icon(
              //     Icons.mail,
              //     color: Colors.white,
              //     size: 20,
              //   ),
              //   label: Text(
              //     'Mail us',
              //   ),
              //   style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(8)),
              //       primary: Color.fromRGBO(14, 167, 129, 1),
              //       fixedSize: Size(120, 40)),
              // ),
              ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(
                      fontFamily: 'Poppins',
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
      ),
    );
  }
}
