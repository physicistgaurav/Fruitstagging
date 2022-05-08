// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_na, non_constant_identifier_names

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fruittag/drawerhead.dart';
import 'package:fruittag/pages/explore.dart';
import 'package:fruittag/pages/game.dart';
import 'package:fruittag/pages/mail_msg.dart';
import 'package:fruittag/pages/profdrawer.dart';
import 'package:fruittag/pages/profile.dart';

class NavDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(context),
          ],
        ),
      ),
    ));
  }
}

Widget MyDrawerList(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        menuItem(context, 4, "Explore", Icons.explore),
        menuItem(context, 3, "Quiz", Icons.videogame_asset),
        menuItem(
          context,
          1,
          "About Us",
          Icons.person,
        ),
        menuItem(
          context,
          2,
          "Send Message",
          Icons.email,
        ),
      ],
    ),
  );
}

Widget menuItem(BuildContext context, int id, String title, IconData icon) {
  return InkWell(
    onTap: () {
      switch (id) {
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfilePagedrawer()));
          break;
        case 2:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactPage()));
          break;
        case 3: Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(14, 167, 129, 1),
            title: Text("Fruits Quiz"),
            centerTitle: true,
            elevation: 0,
          ),
          body: GamePage()
        )));
        break;
        case 4: Navigator.push(context, MaterialPageRoute(builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(14, 167, 129, 1),
              title: Text("Explore Fruits"),
              centerTitle: true,
              elevation: 0,
            ),
            body: ExplorePage()
        )));
        break;
      }
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    },
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              icon,
              size: 20,
              color: Colors.teal,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
