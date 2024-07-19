import 'package:firestore_cloud/clodfirestore_service.dart';
import 'package:firestore_cloud/login.dart';
import 'package:firestore_cloud/main.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUser();
}

class _AddUser extends State<AddUser> {

  final TextEditingController txtfirstname=TextEditingController();
  final TextEditingController txtlastname=TextEditingController();
  final TextEditingController txtemail=TextEditingController();
  final TextEditingController txtphoneno=TextEditingController();
    final TextEditingController txtpassword=TextEditingController();


  void add_user() async{
    final createUser= await CloudFirestore_service().create_user(email: txtemail.text, password: txtpassword.text);
    if(createUser=="Success"){
    final message = await CloudFirestore_service().addUser(firstname: txtfirstname.text, lastname: txtlastname.text, email: txtemail.text, phone_no: txtphoneno.text);
    if(message=="Success"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Added Sucessfully!!!")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Login()));
    }
    else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to Add User!!!")));
    }
    }
    else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to create user!!!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom:40.0),
                child: Text("Registration",style:TextStyle(fontSize: 26.0)),
              ),
              Container( padding: EdgeInsets.only(left: 20.0,right: 20.0), child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text("First Name",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(controller: txtfirstname ,decoration: InputDecoration(hintText: "First Name",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),
          
              Container(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                    child: Text("Last Name",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(controller: txtlastname ,decoration: InputDecoration(hintText: "Last Name",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),
          
              Container(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                    child: Text("Email",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(controller: txtemail ,decoration: InputDecoration(hintText: "Email",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),

              Container(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                    child: Text("Password",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(obscureText:true,controller: txtpassword ,decoration: InputDecoration(hintText: "Password",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),
          
              Container(padding: EdgeInsets.only(left: 20.0,right: 20.0),child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20.0,bottom: 10.0),
                    child: Text("Phone Number",style: TextStyle(fontSize: 20.0),),
                  ),
                  TextField(controller: txtphoneno ,keyboardType:TextInputType.number,decoration: InputDecoration(hintText: "Phone Number",hintStyle: TextStyle(color: Colors.grey.shade500)),),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: ElevatedButton(onPressed: (){add_user();}, child: Text("Register",style:TextStyle(fontSize: 18.0)),style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreenAccent,foregroundColor: Colors.black54,padding: EdgeInsets.only(top:12.0,bottom: 12.0,left:25.0,right:25.0)),),
              )
          
            ],
            ),
        ),
      ),
    );
  }
}