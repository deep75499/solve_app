import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/UpdateProfilePage.dart';

import 'VendorUpdateProfilePage.dart';

class VendorCheckProfile extends StatefulWidget
{
  VendorCheckProfile(List ProfileList,FirebaseAuth auth)
  {
    // _CheckProfileState.ProfileList=ProfileList;
    _VendorCheckProfileState.auth=auth;
    _VendorCheckProfileState.area=ProfileList[0].area;
    _VendorCheckProfileState.mobile=ProfileList[0].mobile;
    _VendorCheckProfileState.name=ProfileList[0].name;
    _VendorCheckProfileState.city=ProfileList[0].city;
    _VendorCheckProfileState.pincode=ProfileList[0].pincode;
    _VendorCheckProfileState.state=ProfileList[0].state;_VendorCheckProfileState.profilePic=ProfileList[0].profilePic;


    _VendorCheckProfileState.m();
  }
  @override
  _VendorCheckProfileState createState() => _VendorCheckProfileState();
}

class _VendorCheckProfileState extends State<VendorCheckProfile>
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VendorUpdateProfilePage(auth)));
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