// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fruittag/pages/mail_msg.dart';

class FruitDetails {
  String? name;
  String? description;
  int? calorie;
  String? imageUrl;

  FruitDetails({this.name, this.description, this.calorie, this.imageUrl});
}

class FruitPage extends StatefulWidget {
  final Map? details;
  const FruitPage({Key? key, this.details}) : super(key: key);

  @override
  State<FruitPage> createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  FlutterTts flutterTts = FlutterTts();

  Future _speak(String text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);

    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.details?['name']}'),
        backgroundColor: Color.fromRGBO(14, 167, 129, 1),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              ClipRRect(
                child: Image.network(
                  '${widget.details?['imageUrl']}',
                  height: 256,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  capitalize(widget.details?['name']),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      color: Color.fromRGBO(14, 167, 129, 1)),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    _speak(widget.details?['name']);
                  },
                  child: Icon(
                    Icons.volume_up_rounded,
                    color: Color.fromRGBO(14, 167, 129, 1),
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Text(
                      "Calorie:",
                      style: TextStyle(
                          color: Color.fromRGBO(14, 167, 129, 1),
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.details?['calorie']} cal',
                      style: TextStyle(
                          color: Colors.grey[600],
                          letterSpacing: 1,
                          fontFamily: 'Poppins',
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  "About ${capitalize(widget.details?['name'])}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(14, 167, 129, 1),
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 18),
                child: Text(
                  '${widget.details?['description']}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                      height: 1.4,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
