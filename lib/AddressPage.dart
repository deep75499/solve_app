import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'CartOut.dart';


class AddressPage extends StatefulWidget {
  AddressPage(FirebaseAuth auth,List cartList)
  {
    _AddressPageState.cartList=cartList;
   _AddressPageState.auth=auth; 
  }
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
static FirebaseAuth auth;
static List cartList;
   DatabaseReference d_address=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('delivery_address').child(auth.currentUser.uid);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        title:Text(
          'Delivery Address',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
          ),
        ),
      
      
        ),
        body: ListView(
          children: <Widget>[

            // uploading ? linearProgress() : Text(''),
            // Container(
            //   height: 230.0,
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: Center(
            //     child: AspectRatio(
            //       aspectRatio: 16/9,
            //       child: Container(
                    
            //         //decoration: BoxDecoration(image: DecorationImage(image: FileImage(_image),fit: BoxFit.contain)),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(padding: EdgeInsets.only(top:12.0)),

              ListTile(
                leading: Icon(Icons.account_box_outlined,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

              ListTile(
                leading: Icon(Icons.perm_device_information_sharp,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:Colors.deepPurple),
                      controller: mobileController,
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),
              
             ListTile(
                leading: Icon(Icons.add_comment_rounded,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: areaController,
                      decoration: InputDecoration(
                        hintText: 'Area/Locality/Flat/House No.',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

               ListTile(
                leading: Icon(Icons.add_comment_rounded,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'City',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

               ListTile(
                leading: Icon(Icons.add_comment_rounded,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: stateController,
                      decoration: InputDecoration(
                        hintText:'State/Country',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

               ListTile(
                leading: Icon(Icons.add_comment_rounded,color: Colors.teal,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:Colors.deepPurple),
                      controller: pincodeController,
                      decoration: InputDecoration(
                        hintText: 'Pin Code',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

          ],
        ),
        floatingActionButton:FloatingActionButton.extended(
          backgroundColor:  Colors.teal,
          foregroundColor: Colors.white,
          onPressed: () {
            print(nameController.text);
              Map<String,String> users= {
                'name':nameController.text,
                'mobile':mobileController.text,
                'city':cityController.text,
                'area':areaController.text,
                'state':stateController.text,
                'pincode':pincodeController.text,
              };
              d_address.set(users).whenComplete(() => print('address have been stored'));



            // Respond to button press
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CheckOutPage(nameController.text,mobileController.text,cityController.text,areaController.text,stateController.text,pincodeController.text,cartList,auth))
              );
          },
          label: Text('Add Address',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
          //icon: Icon(Icons.arrow_right),
        ),
            
    );
  }
}