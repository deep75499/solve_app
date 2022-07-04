import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import 'getProduct.dart';

class BidPage extends StatefulWidget {
  BidPage(String description, String image, String price,String productId, String shortInfo, String title,vendorUid,FirebaseAuth auth)
  {
    _BidPageState.show(description,image,price,productId,shortInfo,title,vendorUid,auth);
  }
  @override
  _BidPageState createState() => _BidPageState();
}

class _BidPageState extends State<BidPage> {
  TextEditingController priceController = TextEditingController();
  static String description;
  static String imageUrl;
  static String price;
  static String productId;
  static String shortInfo;
  static String title;
  static String vendorUid;
  static FirebaseAuth auth;
  bool _hasbeenPressed=false;
  static void show(String description, String image, String price,String productId, String shortInfo, String title,String vendorUid, FirebaseAuth auth)
  {
    _BidPageState.description=description;
    _BidPageState.imageUrl=image;
    _BidPageState.price=price;
    _BidPageState.productId=productId;
    _BidPageState.shortInfo=shortInfo;
    _BidPageState.title=title;
    _BidPageState.vendorUid=vendorUid;
    _BidPageState.auth=auth;

  }


  // final product_name;
  // final product_newprice;
  // final product_oldprice;
  // final product_picture;

  // ProductDetailPage({

  //   this.product_name;
  //   this.product_newprice;
  //   this.product_oldprice;
  //   this.product_picture;

  // });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title:Text(
          'E-Auction',

        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: ()
            {

            },
          ),
          // IconButton
          //   (
          //     icon: Icon(Icons.shopping_cart),
          //     color: Colors.white,
          //     onPressed: (){}
          // ),
        ],
      ),
      body: ListView(
          children: <Widget>[
            Container(

              height: 300.0,
              child: GridTile(

                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color:Colors.white,
                  child:Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(imageUrl),
                  ),

                ),
                footer: Container(
                  color:Colors.white70,
                  child:ListTile(
                      leading:Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 16.0,
                        ),
                      ),
                      title: Row(
                        children:<Widget> [

                          Expanded(
                            child: Text(
                              "₹"+price,
                              style: TextStyle(
                                  color:Colors.teal,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                title: Text(
                  'Product Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(description),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Starting Bid - ₹'+price+' \n\nHighest Bid  - ₹\n\nYour Bid        - ₹',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
            ),
            Divider(),
       Row(
         children: [
           Container(
               width: 250.0,
               child: TextField(
                 keyboardType: TextInputType.number,
                 style: TextStyle(color:Colors.black),
                 controller: priceController,
                 decoration: InputDecoration(
                     hintText: 'Bid in Rupee(₹)',
                     hintStyle: TextStyle(color: Colors.black),
                     border: InputBorder.none
                 ),

               ),
             ),

           Expanded(
               child: MaterialButton(
                 onPressed: (){
                    },
                 color: Colors.purple,
                 textColor: Colors.white,
                 shape: StadiumBorder(),
                 child: Text('Enter'),
               )
           ),
         ],
       )
          ]
      ),
    );
  }




}