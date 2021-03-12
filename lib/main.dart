
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/HomePage.dart';
import 'Splash.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState()
  {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gift Basket",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Splace(),
    );
  }
}












