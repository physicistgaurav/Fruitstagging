// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruittag/pages/fruit.dart';
import 'package:fruittag/services/firestore.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
  @override
  Widget build(BuildContext context) {
    // GestureDetector(
    //   onTap: () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => Applepage()));
    //   },
    //   child: Image.asset(
    //     "assets/apple.jpeg",
    //     height: 30,
    //     width: 30,
    //   ),
    // ),
    return FutureBuilder(
      future: DatabaseService().getFruits(),
      builder: (context, AsyncSnapshot snapshot){
        if (!snapshot.hasData){
          return Center(child:  CircularProgressIndicator(),);
        }else{
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FruitPage(details: snapshot.data[index],)));
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Image.network(
                          '${snapshot.data[index]['imageUrl']}',
                        // height: 60,
                        width: 80,
                        // height: 100,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      capitalize(snapshot.data[index]['name']),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Colors.blueGrey
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
