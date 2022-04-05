// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
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
                    "assets/prof.jpg",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Center(child: Text("Gaurav")),
            subtitle: Center(child: Text("Design Team")),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.mail,
              color: Colors.white,
              size: 20,
            ),
            label: Text(
              'Mail us',
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          ListTile(
            title: Text(
              'About us',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
            subtitle: Text(
              'Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include a search engine, online advertising, cloud computing, software, artificial intelligence, quantum computing, and hardware.',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          )
        ],
      ),
    );
  }
}
