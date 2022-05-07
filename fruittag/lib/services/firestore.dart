import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";

class DatabaseService {
  final CollectionReference fruitCollection = FirebaseFirestore.instance.collection('fruits');

  Stream<QuerySnapshot> get fruits {
    return fruitCollection.snapshots();
  }

  Future<List> getFruits() async {
    QuerySnapshot snaps =  await fruitCollection.get();
    final allData = snaps.docs.map((doc) => doc.data()).toList();
    // print(allData);
    return allData;
  }

  Future getFruit(name) async {
    DocumentSnapshot snapshot = await fruitCollection.doc(name).get();
    if (snapshot.exists){
      // Object? data = snapshot.data();
      return snapshot.data();
    }
    // return snapshot;
  }
}