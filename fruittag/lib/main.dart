// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fruittag/drawer.dart';
import 'package:fruittag/pages/game.dart';
import 'package:fruittag/pages/front.dart';
import 'package:fruittag/pages/profile.dart';
import 'package:fruittag/pages/explore.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MaterialApp(
    title: "Fruits-tag",
    debugShowCheckedModeBanner: false,
    home: AnimatedSplashScreen(
      splash: Center(
        child: Image.asset(
          "assets/splashimage.png",
        ),
      ),
      duration: 3000,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      backgroundColor: Colors.teal,
      splashIconSize: 200,
      splashTransition: SplashTransition.slideTransition,
      nextScreen: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 2;

  final Screens = [
    FrontPage(),
    ExplorePage(),
    GamePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final widget_items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.explore, size: 30),
      Icon(Icons.games_sharp, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("Fruits-tag"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: Colors.green,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.purple,
          height: 60,
          index: index,
          onTap: (index) => setState(() => this.index = index),
          items: widget_items,
        ),
      ),
    );
  }
}
