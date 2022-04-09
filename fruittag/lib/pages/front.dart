// ignore_for_file: prefer_const_constructors, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
          scrollDirection: Axis.vertical,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/newsplash.png",
              height: 150,
              width: 150,
            ),
            Spacer(),
            image != null
                ? Image.file(
                    image!,
                    width: 100,
                    height: 200,
                  )
                : Image.asset(
                    "assets/up.png",
                    height: 160,
                    width: 160,
                  ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                "Your Image",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => pickImage(ImageSource.gallery),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.image_outlined,
                    color: Colors.teal,
                  ),
                  title: Text("Pick Gallery"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                pickImage(ImageSource.camera);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ListTile(
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.teal,
                  ),
                  title: Text("Pick Camera"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
