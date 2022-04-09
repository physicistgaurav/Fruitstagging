// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_na, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fruittag/drawerhead.dart';

class NavDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            MyHeaderDrawer(),
            MyDrawerList(),
          ],
        ),
      ),
    ));
  }
}

Widget MyDrawerList() {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        menuItem(
          1,
          "About Us",
          Icons.person,
        ),
        menuItem(2, "text here", Icons.read_more),
        menuItem(
          3,
          "email",
          Icons.email,
        ),
        menuItem(
          4,
          "send messgae",
          Icons.send_and_archive,
        ),
        menuItem(
          5,
          "thanks",
          Icons.wheelchair_pickup_outlined,
        ),
      ],
    ),
  );
}

Widget menuItem(int id, String title, IconData icon) {
  return Material(
    child: InkWell(
      onTap: () {},
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
    ),
  );
}
