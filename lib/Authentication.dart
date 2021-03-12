import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'HomePage.dart';


class Authentication extends StatefulWidget{
  @override
  AuthenticationState createState() => AuthenticationState();
}


class AuthenticationState extends State<Authentication>{


@override
Widget build(BuildContext context) {
// TODO: implement build
throw UnimplementedError();
}

  String _email, _password, name;
  FirebaseAuth auth = FirebaseAuth.instance;

   Authentication()
   {

   }


    Future<void> signIn(String email, String password) async
    {
      print(email);
      print(password);

      this._email = email;
      print(_email);
      this._password = password;

      //auth.signInWithEmailAndPassword(email: "a@gmail.com",password: "123456");
      // UserCredential userCredential = await auth.signInAnonymously();

      //print(userCredential.user.uid);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => HomePage(_email)));
    }

    Future<void> signUp(String name, String email, String password) async
    {
      this.name = name;
      this._email = email;
      this._password = password;
      try {
        await auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        // UserCredential userCredential = await auth.signInAnonymously();

        //print(userCredential.user.uid);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPage()));
      }
      on FirebaseAuthException catch (e) {
        return e.message;
      }
    }

}
