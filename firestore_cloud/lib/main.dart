import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_cloud/add_user.dart';
import 'package:firestore_cloud/login.dart';
import 'package:firestore_cloud/shared_preferences_service.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Abhinav MIS",style:TextStyle(color: Colors.white)),leading: IconButton(onPressed: (){_scaffoldKey.currentState?.openDrawer();},icon: Icon(Icons.menu),color: Colors.white,),backgroundColor: Colors.blue,),
      body: SafeArea(
        child: Column(
                children: <Widget>[
             Text("Welcome Back ${prefs.user_data['firstname']}!!!")
            ],
          ),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(children: <Widget>[

      ],),
      ),),
    );
    
  }
}
