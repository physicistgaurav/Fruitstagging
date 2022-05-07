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

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(60, 230, 190, 1),
        body: Container(
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
              // image != null
              //     ? Image.file(
              //         image!,
              //         width: 100,
              //         height: 200,
              //       )
              //     : Image.asset(
              //         "assets/up.png",
              //         height: 100,
              //         width: 100,
              //       ),
              // const SizedBox(
              //   height: 24,
              // ),
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
              (searching)? Container(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white,),
                ),
              ) : Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => pickImage(ImageSource.camera),
                      child: Container(
                        height: 150,
                        // width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color.fromRGBO(0, 217, 255, 1),
                              Color.fromRGBO(0, 135, 224, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(5),
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
                                    "Camera",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    "Scan Image using Camera",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: () => pickImage(ImageSource.gallery),
                      child: Container(
                        height: 150,
                        // width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color.fromRGBO(245, 92, 189, 1),
                                Color.fromRGBO(245, 70, 99, 1),
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
                                    "Gallery",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    "Scan Image from Gallery",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.image_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      // onTap: () => pickImage(ImageSource.gallery),
                      child: Container(
                        height: 150,
                        // width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color.fromRGBO(0, 224, 119, 1),
                                Color.fromRGBO(12, 170, 59, 1),
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
                                    "Link",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    "Get Image from a link",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.link,
                                color: Colors.white,
                                size: 50,
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () => pickImage(ImageSource.gallery),
              //   child: Card(
              //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //     child: ListTile(
              //       leading: Icon(
              //         Icons.image_outlined,
              //         color: Colors.teal,
              //       ),
              //       title: Text("Pick From Gallery"),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     pickImage(ImageSource.camera);
              //   },
              //   child: Card(
              //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //     child: ListTile(
              //       leading: Icon(
              //         Icons.camera_alt_outlined,
              //         color: Colors.teal,
              //       ),
              //       title: Text("Pick From Camera"),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
