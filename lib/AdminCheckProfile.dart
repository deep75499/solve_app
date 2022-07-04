import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/UpdateProfilePage.dart';

import 'AdminUpdateProfilePage.dart';

class AdminCheckProfile extends StatefulWidget
{
  AdminCheckProfile(List ProfileList,FirebaseAuth auth)
  {
    // _CheckProfileState.ProfileList=ProfileList;
    _AdminCheckProfileState.auth=auth;
    _AdminCheckProfileState.area=ProfileList[0].area;
    _AdminCheckProfileState.mobile=ProfileList[0].mobile;
    _AdminCheckProfileState.name=ProfileList[0].name;
    _AdminCheckProfileState.city=ProfileList[0].city;
    _AdminCheckProfileState.pincode=ProfileList[0].pincode;
    _AdminCheckProfileState.state=ProfileList[0].state;_AdminCheckProfileState.profilePic=ProfileList[0].profilePic;


    _AdminCheckProfileState.m();
  }
  @override
  _AdminCheckProfileState createState() => _AdminCheckProfileState();
}

class _AdminCheckProfileState extends State<AdminCheckProfile>
{


  //static List ProfileList;
  static FirebaseAuth auth;
  static String profilePic;
  static String name;
  static String mobile;
  static String area;
  static String city;
  static String state;
  static String pincode;
//  DatabaseReference profile =FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('profile');

  static void m()
  {
    print(area+name);

  }
  @override
  Widget build(BuildContext context) {

    return   ProfilePost();


  }

  Widget ProfilePost() {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: ListView(

        children: [
          Padding(
            padding: EdgeInsets.only(top:12.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: profilePic ==null?AssetImage('assets/images/vocal2.png'):NetworkImage(profilePic),


                radius: 80.0,
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Personal Information')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(name),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('email'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(mobile),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Text('Your Address'),


                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Text(area),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(city),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(pincode),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminUpdateProfilePage(auth)));
                  },
                    child: Text('Update',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),


          ),
        ],
      ),
    );
  }
}