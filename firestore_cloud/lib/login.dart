import 'dart:convert';

import 'package:firestore_cloud/add_user.dart';
import 'package:firestore_cloud/clodfirestore_service.dart';
import 'package:firestore_cloud/main.dart';
import 'package:firestore_cloud/shared_preferences_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {

  final TextEditingController txtemail=TextEditingController();
  final TextEditingController txtpassword=TextEditingController();

  void LoginUser() async{
    final bool? is_success=await CloudFirestore_service().Login(email: txtemail.text, password: txtpassword.text);
    if(is_success!=Null && is_success==true){
      final user_data=await CloudFirestore_service().getUsers(email: txtemail.text);
      await prefs.setUserData(jsonEncode(user_data));
      await prefs.getUserData();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful!!!",style: TextStyle(color: Colors.black54),),backgroundColor: Colors.lightGreenAccent,));
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context)=>MyHomePage()));
    }
    else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed!!!",style: TextStyle(color: Colors.white),),backgroundColor: Colors.redAccent[200],));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Login",style: TextStyle(fontSize: 24.0),),
           Container(padding: const EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                    child:  Text("Email",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(controller: txtemail ,decoration: InputDecoration(hintText: "Email",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),

              Container(padding: const EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top:20.0,bottom: 10.0),
                    child: Text("Password",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(obscureText:true,controller: txtpassword ,decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),

              Container(padding:EdgeInsets.only(top:15.0),child: InkWell(onTap: ()=>{Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>AddUser()))},child: Text("Register..?",style: TextStyle(color: Colors.blueAccent),))),

              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(onPressed: (){LoginUser();}, child: Text("LOGIN",style:TextStyle(fontSize: 18.0)),style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent,foregroundColor: Colors.black54,padding: EdgeInsets.only(top:12.0,bottom: 12.0,left:25.0,right:25.0)),),
              ),
          
          
        ],
      ),

    );
  }
}