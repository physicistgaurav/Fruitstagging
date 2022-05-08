// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruittag/drawer.dart';
import 'package:fruittag/pages/game.dart';
import 'package:fruittag/pages/front.dart';
import 'package:fruittag/pages/profile.dart';
import 'package:fruittag/pages/explore.dart';
import 'package:page_transition/page_transition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  int index = 0;

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
      Icon(Icons.gamepad_outlined, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(14, 167, 129, 1),
        title: (index != 0) ? Text("Fruits Tag") : Text(""),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.widgets_outlined),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: Color.fromRGBO(14, 167, 129, 1),
          backgroundColor:
              (index == 0) ? Color.fromRGBO(60, 230, 190, 1) : Colors.white10,
          buttonBackgroundColor: Color.fromRGBO(14, 167, 129, 1),
          height: 60,
          index: index,
          onTap: (index) => setState(() => this.index = index),
          items: widget_items,
          animationDuration: Duration(milliseconds: 450),
        ),
      ),
    );
  }
}
