import 'package:flutter/material.dart';
import 'CartOut.dart';


class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        title:Text(
          'Add Address',
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
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

              ListTile(
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
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
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'Flat / House number',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

               ListTile(
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
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
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'State/Country',
                        hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.pink),

               ListTile(
                leading: Icon(Icons.perm_device_information,color: Colors.pink,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:Colors.deepPurple),
                      controller: null,
                      decoration: InputDecoration(
                        hintText: 'Pine code',
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
            // Respond to button press
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChekOutPage())
              );
          },
          label: Text('Add Address',style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),),
          //icon: Icon(Icons.arrow_right),
        ),
            
    );
  }
}