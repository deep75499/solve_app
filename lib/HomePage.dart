
import 'dart:ffi';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solve_app/AccountSetting.dart';
import 'package:solve_app/UserMyOrder.dart';
import 'package:solve_app/UserWishList.dart';

import 'CashOnDelivery.dart';
import 'getProduct.dart';
import 'ProductDeatilPage.dart';
import 'Horizontal.dart';
import 'getProduct.dart';
import 'UpdateProfilePage.dart';
import 'UserOrderList.dart';
import 'getUserOrder.dart';
import 'searchBox.dart';
import 'LoginPage.dart';
import 'Wishlist.dart';
import 'package:solve_app/Cart2.dart';
import 'package:solve_app/HelpPage.dart';

class HomePage extends StatefulWidget {

  HomePage(String email,FirebaseAuth auth,List getProductList)
  {//HomePageState();
    print(email);
    print(auth);
    CashOnDelivery.m(auth, getProductList);
    HomePageState.give(email, auth,getProductList);
    DatabaseReference getUser_order=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('user_order');

    getUser_order.once().then((DataSnapshot snap) => HomePageState.getOrderValue(snap));

  }
  @override
  HomePageState createState()=>HomePageState();
}
class HomePageState extends  State<HomePage>
{   DatabaseReference getCart=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('cart');
static List<getUserOrder> UserOrderList =List();
static void getOrderValue(DataSnapshot snap) {
  var KEYS = snap.value.keys;
  var DATA = snap.value;
  UserOrderList.clear();
  for (var individualKey in KEYS) {
    getUserOrder Product = new getUserOrder
      (
      DATA[individualKey]['area'],
      DATA[individualKey]['city'],
      DATA[individualKey]['mobile'],
      DATA[individualKey]['name'],
      DATA[individualKey]['pincode'],
      DATA[individualKey]['price'],
      DATA[individualKey]['product_name'],
      DATA[individualKey]['product_id'],
      DATA[individualKey]['state'],
    );
    UserOrderList.add(Product);
    // print(Product.title.toString());

  }
  print(UserOrderList.length);
  print("helloo");
  print(UserOrderList[0].state);

  //Navigator.push(context,MaterialPageRoute(builder: (context) =>UserWishList(UserProductList,auth)));
}
static String email;
  static FirebaseAuth auth;
  static  List<getProduct> getProductList ;


  static  List<getProduct> getCartList =List();

 void getCartValue(DataSnapshot snap) {
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
          DATA[individualKey]['vendorUid']
      );
      getCartList.add(Product);
      print(Product.title.toString());


    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart2(auth,getCartList)));

    print(getCartList.length);
  }
  static void give(String email, FirebaseAuth auth,List getProductList)
  {
    print(email);
    print(auth.currentUser.email);
    HomePageState.email=email ;
    HomePageState.auth=auth;
    HomePageState.getProductList=getProductList;
  }
  DatabaseReference u_ProductRef=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('products');

 // Query ref = FirebaseDatabase.instance.reference().child('users');
  static  List<getProduct> UserProductList =List();
  void getValue(DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;
    UserProductList.clear();
    for (var individualKey in KEYS) {
      getProduct Product = new getProduct
        (
          DATA[individualKey]['description'],
          DATA[individualKey]['imageUrl'],
          DATA[individualKey]['price'],
          DATA[individualKey]['productId'],
          DATA[individualKey]['shortInfo'],
          DATA[individualKey]['title'],
        DATA[individualKey]['vendorUid']
      );
      UserProductList.add(Product);
      print(Product.title.toString());

    }
    print(UserProductList.length);
    Navigator.push(context,MaterialPageRoute(builder: (context) =>UserWishList(UserProductList,auth)));
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              //accountName: Text(),
              accountEmail: Text(auth.currentUser.email),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.teal,
              ),
              title: Text(
                "HomePage",
              ),
              //icon: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => HomePage(email, auth,getProductList)));
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.teal,
              ),
              title: Text(
                "My account",
              ),
              //icon: Icon(Icons.home),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=>AccountSetting(auth)));
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.teal,
              ),
              title: Text(
                "My Order",
              ),
              //icon: Icon(Icons.home),
              onTap: () async {

                Navigator.push(context,MaterialPageRoute(builder:(context)=>UserMyOrder(UserOrderList)));

              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Colors.teal,
              ),
              title: Text(
                "Wishlist",
              ),
              //icon: Icon(Icons.home),
              onTap: () {

                u_ProductRef.once().then((DataSnapshot snap) => getValue(snap));
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.redAccent,
              ),
              title: Text(
                "Help",
              ),
              //icon: Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>HelpPage()));
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.teal,
              ),
              title: Text(
                "Logout",
              ),
              //icon: Icon(Icons.home),
              onTap: () {
                auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                auth = null;
                if (auth == null) {
                  print("222222222222222222222222222");
               //  Navigator.pop(context,MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Gift Basket',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: Datasearch());
              }),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              getCart.once().then((DataSnapshot snap) => getCartValue(snap));

            },
          ),
        ],
      ),
      body:Products(getProductList,auth),
    );
  }


}
//////////////////////////////////////////////////////////////////////////////

class Products extends StatefulWidget {
  Products(List getProductList,FirebaseAuth auth)
  {
    _ProductsState.getProductList=getProductList;
    _ProductsState.auth=auth;
  }
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //   var product_list = [
  //   {
  //     "name":"Teady Bear",
  //     "picture":"assets/images/images.jpg",
  //     "old_price":"\$24",
  //     "price":"\$15",
  //   },

  //   {
  //     "name":"Gift item",
  //     "picture":"assets/images/images.jpg",
  //     "old_price":"\$24",
  //     "price":"\$15",
  //   }
  // ];
  static  List getProductList =List();
 static FirebaseAuth auth;
  @override
  Widget build(BuildContext context) {
    Widget image_crousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage("assets/images/pro2.png"),
          AssetImage("assets/images/pro2.png"),
          AssetImage("assets/images/pro2.png"),
          AssetImage("assets/images/images.jpg"),
          AssetImage("assets/images/toy.jpg"),
          AssetImage("assets/images/images.jpg"),
          AssetImage("assets/images/pro1.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
      ),
    );
    return Container(

      child: getProductList.length == 0
          ? new Text("no product available")
          : new ListView.builder(
          itemCount: getProductList.length,
          itemBuilder: (_, index) {
            return ProductPost(getProductList[index].description,
                getProductList[index].imageUrl, getProductList[index].price,
                getProductList[index].productId,
                getProductList[index].shortInfo, getProductList[index].title,getProductList[index].vendorUid);
          }),
    );

      //  image_crousel, //image Crousel
     //
     // /// padding category wedget
     //  Padding(
     //    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
     //    child: Text(
     //      "Category",
     //    ),
     //  ),
     //
     //  //Horizonatal List view
     //  Horizontal(),
     //
     //  //recent item page
     //  Padding(
     //    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
     //    child: Text(
     //      "Recent Products",
     //    ),
     //  ),
       //ProductCall(),

      // Productitem(),



      // Productitem(),

      //foodCart(),



  }

  Widget ProductPost(String description, String image, String price,String productId, String shortInfo, String title,String vendorUid){
    return FittedBox(
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: InkWell(
          onTap: () {

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ProductDetailPage(description,image,price,productId,shortInfo,title,vendorUid,auth)));
          },
          child: Row(
            children: [
              // itemCake(),
              Container(
                width: 90,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight,
                    image: NetworkImage(image),
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.redAccent),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      shortInfo,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 9.5,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        // Icon(
                        //   Icons.shopping_cart,
                        //   size: 15,
                        // ),
                        SizedBox(width: 5),
                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "₹"+price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9.5,
                                color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "\$34",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9.5,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Rating',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 7,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget foodCart() {
    return FittedBox(
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: InkWell(
          onTap: () {
          },
          child: Row(
            children: [
              // itemCake(),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "Teady Bear",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.redAccent),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Lorem Ipsum \nis simply dummy",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 9.5,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        // Icon(
                        //   Icons.shopping_cart,
                        //   size: 15,
                        // ),
                        SizedBox(width: 5),
                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "\$24",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9.5,
                                color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "\$34",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9.5,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Rating',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 7,
                              color: Colors.grey),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                        Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 90,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    fit: BoxFit.contain,
                    alignment: Alignment.topRight,
                    image: AssetImage('assets/images/gift1.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
