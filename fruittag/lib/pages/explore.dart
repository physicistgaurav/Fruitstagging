// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruittag/pages/fruit.dart';
import 'package:fruittag/services/firestore.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

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
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Fruitpage(details: snapshot.data[index],)));
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Image.network(
                      '${snapshot.data[index]['imageUrl']}',

                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
