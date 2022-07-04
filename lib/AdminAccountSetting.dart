
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/UpdateProfilePage.dart';
import 'CheckProfile.dart';
import 'AdminCheckProfile.dart';
import 'AdminUpdateProfilePage.dart';
import 'getProfile.dart';

class AdminAccountSetting extends StatefulWidget
{
  AdminAccountSetting(FirebaseAuth auth)
  {
    _AdminAccountSettingState.auth=auth;
  }
  @override
  createState() => _AdminAccountSettingState();
}

class _AdminAccountSettingState extends State<AdminAccountSetting> {

  DatabaseReference profile=FirebaseDatabase.instance.reference().child('Admins').child(auth.currentUser.uid).child('profile');

  static List<getProfile> ProfileList =List();

  static FirebaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Setting'),),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child:Text('check Your Profile'),
            onPressed: (){
              try {
                profile.once().then((DataSnapshot snap) =>getValue(snap));
              }
              catch(e){

              }


            },),
          RaisedButton(
              child:Text('Update Your Profile'),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminUpdateProfilePage(auth)));
              }),
          RaisedButton(
              child:Text('Change Your Password'),
              onPressed: (){

              }),

        ],
      ),
    );
  }
  void getValue(DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;
    ProfileList.clear();
    for (var individualKey in KEYS) {
      getProfile profile= new getProfile
        (
          DATA[individualKey]['area'],
          DATA[individualKey]['city'],
          DATA[individualKey]['mobile'],
          DATA[individualKey]['name'],
          DATA[individualKey]['pincode'],
          DATA[individualKey]['profilePic'],
          DATA[individualKey]['state']
      );
      ProfileList.add(profile);
    }
    print(ProfileList.length);
    print(ProfileList.toString());
    Navigator.push(context,MaterialPageRoute(builder: (context) =>AdminCheckProfile(ProfileList,auth)));
  }
}

