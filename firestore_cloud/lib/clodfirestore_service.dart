
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CloudFirestore_service {
  Future<dynamic> getUsers({required String email}) async{
    try{
      CollectionReference users= FirebaseFirestore.instance.collection('users');
      final users_data= await users.doc(email).get();
      var userData=users_data.data(); 
      return userData;
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<bool?> Login({required String email, required String password}) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    catch(e){
      print(e.toString());
      return false;
    }
  }

  Future<String?> create_user({required String email,required String password}) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return "Success";
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<String?> addUser({required String firstname,required String lastname,required String email,required String phone_no}) async{
    try{
      CollectionReference users= FirebaseFirestore.instance.collection('users');    
      await users.doc(email).set({"firstname":firstname,"lastname":lastname,"email":email,"phone_no":phone_no});
      return "Success";
    }
    catch(e){
      print(e.toString());
    }
  }
}