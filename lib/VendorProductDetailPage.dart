import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Cart2.dart';

class VendorProductDetailPage extends StatefulWidget {
  VendorProductDetailPage(String description, String image, String price,String productId, String shortInfo, String title,FirebaseAuth auth)
  {
    _VendorProductDetailPageState.show(description,image,price,productId,shortInfo,title,auth);
  }
  @override
  _VendorProductDetailPageState createState() => _VendorProductDetailPageState();
}

class _VendorProductDetailPageState extends State<VendorProductDetailPage> {
  

  static String description;
  static String imageUrl;
  static String price;
  static String productId;
  static String shortInfo;
  static String title;
  static FirebaseAuth auth;
  DatabaseReference rem_ref=FirebaseDatabase.instance.reference().child('vendors').child(auth.currentUser.uid).child('products').child(productId);
  static void show(String description, String image, String price,String productId, String shortInfo, String title, FirebaseAuth auth)
  {
    _VendorProductDetailPageState.description=description;
    _VendorProductDetailPageState.imageUrl=image;
    _VendorProductDetailPageState.price=price;
    _VendorProductDetailPageState.productId=productId;
    _VendorProductDetailPageState.shortInfo=shortInfo;
    _VendorProductDetailPageState.title=title;
    _VendorProductDetailPageState.auth=auth;

  }
  DatabaseReference userProduct =FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('products');

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
  void addProduct()
  {
    Map<String, Object> product= {
      'description':description,
      'imageUrl':imageUrl,
      'price':price,
      'productId':productId,
      'shortInfo':shortInfo,
      'title':title,
    };
    userProduct.push().set(product).whenComplete(() => showAlertDialog(context));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:Text(
          'Gift Basket',

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
          IconButton
            (
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: (){}
          ),
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
                              '₹'+"10000",
                              style: TextStyle(
                                  color:Colors.grey,
                                  decoration: TextDecoration.lineThrough
                              ),
                            ),
                          ),
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
              padding: EdgeInsets.all(10.0),
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
            Row(
              children: <Widget>[
                RaisedButton(
                    child: Text('Update'),
                    onPressed: (){}),
                RaisedButton(
                  child: Text('Delete product'),
                  onPressed: (){
                    rem_ref.remove().whenComplete(() => print("product deleted from vendor database"));
                  },
                ),

              ],
            )
          ]
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) =>VendorProductDetailPage(description, imageUrl, price, productId, shortInfo, title, auth)));



      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Product Successfully Added to Wishlist!"),
      content: Text("Return Back"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}