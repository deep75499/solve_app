import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Cart2.dart';
import 'getProduct.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(String description, String image, String price,String productId, String shortInfo, String title,vendorUid,FirebaseAuth auth)
  {
   _ProductDetailPageState.show(description,image,price,productId,shortInfo,title,vendorUid,auth);
  }
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

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
    _ProductDetailPageState.description=description;
    _ProductDetailPageState.imageUrl=image;
    _ProductDetailPageState.price=price;
    _ProductDetailPageState.productId=productId;
    _ProductDetailPageState.shortInfo=shortInfo;
    _ProductDetailPageState.title=title;
    _ProductDetailPageState.vendorUid=vendorUid;
    _ProductDetailPageState.auth=auth;

  }
  DatabaseReference userProduct =FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('products').child(productId);
  DatabaseReference userCart =FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('cart').child(productId);

  DatabaseReference getCart=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('cart');

  static  List<getProduct> getCartList =List();
  void getValue(DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;
    getCartList.clear();
    for (var individualKey in KEYS) {
      getProduct Product = new getProduct
        (
          DATA[individualKey]['description'],
          DATA[individualKey]['imageUrl'],
          DATA[individualKey]['price'],
          DATA[individualKey]['productId'],
          DATA[individualKey]['shortInfo'],
          DATA[individualKey]['title'],
          DATA[individualKey]['vendorUid'],
      );
      getCartList.add(Product);
      print(Product.title.toString());

    }
    print(getCartList.length);
    Navigator.push(context,MaterialPageRoute(builder: (context) =>Cart2(auth,getCartList)));

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
  void addtoCart()
  {
    Map<String, Object> product= {
      'description':description,
      'imageUrl':imageUrl,
      'price':price,
      'productId':productId,
      'shortInfo':shortInfo,
      'title':title,
      'vendorUid':vendorUid,
    };
    userCart.set(product).whenComplete(() => showAlertDialog(context));
  }
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
  userProduct.set(product).whenComplete(() => showAlertDialog(context));

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

                //Divider(),
                Expanded(
                    child: MaterialButton(
                      onPressed: (){
                        addtoCart();
                        getCart.once().then((DataSnapshot snap) => getValue(snap));

                      },
                      color: Colors.teal,
                      textColor: Colors.white,
                      shape: StadiumBorder(),
                      child: Text('Buy Now'),
                    )
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart,color:Colors.teal),
                    onPressed: (){
                      addtoCart();
                      getCart.once().then((DataSnapshot snap) => getValue(snap));
                     // Navigator.push(context,MaterialPageRoute(builder: (context) =>Cart2(auth,getCartList)));

                    }
                ),
                IconButton(
                    icon: Icon(Icons.favorite,color:_hasbeenPressed? Colors.teal:Colors.black26),
                    onPressed: (){
                      setState(() {
                        _hasbeenPressed = !_hasbeenPressed;
                      });
                      if(_hasbeenPressed==true) {
                        addProduct();
                      }
                      else
                      {
                       userProduct.remove().whenComplete(() =>  rem_showAlertDialog(context)); 
                      }
                    }
                )
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
        Navigator.pop(context, MaterialPageRoute(builder: (context) =>ProductDetailPage(description, imageUrl, price, productId, shortInfo, title,vendorUid, auth)));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Product Successfully Added "),
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
  rem_showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context, MaterialPageRoute(builder: (context) =>ProductDetailPage(description, imageUrl, price, productId, shortInfo, title,vendorUid, auth)));
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Product removed from Wishlist!"),
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