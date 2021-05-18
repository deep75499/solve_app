import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/getUserAddress.dart';

import 'AddressPage.dart';
import 'Cart2.dart';
import 'CashOnDelivery.dart';


class CofirmOrderCard extends StatefulWidget {
  CofirmOrderCard(List cartList,FirebaseAuth auth)
  {
    _CofirmOrderCardState.cartList=cartList;
    _CofirmOrderCardState.auth=auth;
    _CofirmOrderCardState.sumall();
  }
  @override
  _CofirmOrderCardState createState() => _CofirmOrderCardState();
}

class _CofirmOrderCardState extends State<CofirmOrderCard> {

  DatabaseReference user_order=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('user_order');
  DatabaseReference delivery_address=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('delivery_address');
  DatabaseReference order_req=FirebaseDatabase.instance.reference().child('vendors');
  static  List<getUserAddress> orderList =List();
  void getValue(DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;
    orderList.clear();
    for (var individualKey in KEYS) {
      getUserAddress uaddress = new getUserAddress
        (
          DATA[individualKey]['area'],
          DATA[individualKey]['city'],
          DATA[individualKey]['mobile'],
          DATA[individualKey]['name'],
          DATA[individualKey]['pincode'],
          DATA[individualKey]['state'],


      );
     orderList.add(uaddress);
      print(uaddress.state.toString());

    }
    print(orderList.length);
    print(cartList[0].title);
    for(int i=0;i<cartList.length;i++)
      {
        DatabaseReference order_req=FirebaseDatabase.instance.reference().child('vendors').child(cartList[i].vendorUid).child('order_request');

        addtoOrder(cartList[i].shortInfo, cartList[i].productId, cartList[i].price,order_req);

      }
    //Navigator.push(context,MaterialPageRoute(builder: (context) =>UserWishList(UserProductList,auth)));
  }
  void addtoOrder(String shortinfo,String productid,String price,DatabaseReference order_req)
  {
    Map<String, Object> UserOrder= {
      'product_name':shortinfo,
      'product_id':productid,
      'price':price,
      'name':orderList[0].name,
      'mobile':orderList[0].mobile,
      'area':orderList[0].area,
      'city':orderList[0].city,
      'pincode':orderList[0].pincode,
      'state':orderList[0].state,
    };
    user_order.push().set(UserOrder).whenComplete(() => print("order have been save to user account"));
    order_req.push().set(UserOrder).whenComplete(() => print("vendor also recived the order"));
  }
  static List cartList;
  static int priceSum=0;
  static FirebaseAuth auth;
  static int sumall()
  {priceSum=0;
  int index=0;
  int n=cartList.length;
  while(index<n)
  {
    _CofirmOrderCardState.priceSum+=int.parse(cartList[index].price);
    index++;
  }
  print(priceSum);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset("assets/images/recipt.jpg"),
                ),
                Spacer(),
                Text("Payment Method->COD"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text:"₹"+ priceSum.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 190,
                  child:RaisedButton(
                    child:Text("Confirm Order"),
                    onPressed: () {
                      placeOrder(context);

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        delivery_address.once().then((DataSnapshot snap) => getValue(snap));
        Navigator.push(context, MaterialPageRoute(builder: (context) => CashOnDelivery()));



      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Congratulations!"),
      content: Text("Your Order have been confirmed"),
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

  placeOrder(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {

        showAlertDialog(context);


      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Place Order!"),
      content: Text("Are You Sure"),
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
