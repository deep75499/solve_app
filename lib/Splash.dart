import 'dart:async';
import 'LoginPage.dart';
import 'package:flutter/material.dart';


class Splace extends StatefulWidget{
  @override
  _SplaceState createState() => _SplaceState();
}

class _SplaceState extends State<Splace>{

  @override
  void initState()
  {
    super.initState();
    debugPrint("Start Splace Screen");
    Timer(Duration(seconds:5), finished);
  }

  void finished()
  {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginPage()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome To\nGift Basket",
                  style: TextStyle(
                    fontSize:40.0,
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily:"sansarif",

                  ),
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                CircularProgressIndicator(

                  backgroundColor: Colors.white,

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        )
                    )
                  ],
                )
              ],
            )
          ],
        )
    );
  }
}