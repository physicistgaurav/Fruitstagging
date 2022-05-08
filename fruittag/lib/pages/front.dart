// ignore_for_file: prefer_const_constructors, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruittag/pages/fruit.dart';
import 'package:fruittag/services/firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fruittag/model/detector.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  File? image;
  Detector detector = Detector();
  String classified = "";

  List details = [];
  bool searching = false;
  bool urlOpen = false;

  Future ffn(name) async{
    final fruit = await DatabaseService().getFruit(name);
    return fruit;
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);

      final tempClassified = await detector.detectImage(image);
      setState(() {
        classified = tempClassified.toString().replaceAll(" ", "");
      });

      var fruitName = "";
      for(int i=0; i<classified.length - 1; i++) {
        fruitName += classified[i];
      }
      print(fruitName);
      var fruitDetail = details.where((element) => element['name'] == fruitName).toList();

      setState(() {
        this.image = imageTemporary;
      });
      searching = true;
      await Future.delayed(const Duration(milliseconds: 600), (){});
      setState(() {
        searching = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => FruitPage(details: fruitDetail[0],)));
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  Future call()async{
    final fruit = await DatabaseService().getFruits();
    setState(() {
      details = fruit;
    });

    print(details.length);
  }

  @protected
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      searching = false;
    });
    if (details.isEmpty){
      call();
    }
  }

  Widget customInkWell(int id, String title, String path){
    return InkWell(
      onTap: (){
        switch(id){
          case 1: pickImage(ImageSource.camera);
          break;
          case 2: pickImage(ImageSource.gallery);
          break;
          case 3: pickImage(ImageSource.gallery);
          break;
        }
      },
      child: Container(
        height: 140,
        // width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: (id == 3)? [
                Color.fromRGBO(0, 224, 119, 1),
                Color.fromRGBO(12, 170, 59, 1),
              ] : (id == 2)? [
                  Color.fromRGBO(245, 92, 189, 1),
                  Color.fromRGBO(245, 70, 99, 1),
                ] : [
                  Color.fromRGBO(0, 217, 255, 1),
                  Color.fromRGBO(0, 135, 224, 1),
                ],
            ),
            // border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(-1, 1), // changes position of shadow
              ),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    "Scan Image from $title",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              Image.asset(
                path,
                height: 60,
              )
            ],
          ),
        ),

      ),
    );
  }

  Widget urlBox(){
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          // height: 300,
          width: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 224, 119, 1),
                Color.fromRGBO(12, 170, 59, 1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                    Text(
                      'Image from URL',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(''),
                  ],
                ),
                SizedBox(height: 20,),
                Text("URL: "),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(60, 230, 190, 1),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(14, 167, 129, 1),
                  Color.fromRGBO(60, 230, 190, 1)
                ],
              ),
            ),
            child: Column(
              // scrollDirection: Axis.vertical,
              children: <Widget>[
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      height: 90,
                      // width: 100,
                      child: Column(
                        children: [
                          Text(
                            'Know your',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'FRUITS & VEGETABLES',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Text(classified)
                        ],
                      ),
                    ),
                  ),
                ),
                (searching)? SizedBox(
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white,),
                  ),
                ) : (urlOpen)? urlBox() : Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customInkWell(1, "Camera", "assets/camera.png"),
                      SizedBox(height: 15,),
                      customInkWell(2, "Gallery", "assets/image.png"),
                      SizedBox(height: 15,),
                      customInkWell(3, "Link", "assets/link.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
