import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{
  Firestore _firestore = Firestore.instance;
  String collection = "Users";

  createUser(Map data){
   // String id = value["userId"];
    _firestore.collection(collection).document(data["key"]).setData(data);
  }
}