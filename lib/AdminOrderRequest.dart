import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:solve_app/HomePage.dart';
import 'package:solve_app/UserOrderList.dart';
import 'package:solve_app/getUserOrder.dart';

import 'LoginPage.dart';


class AdminOrderRequest extends StatefulWidget
{
  AdminOrderRequest(List AdminOrderRequestList)
  {
    _AdminOrderRequestState.AdminOrderRequestList=AdminOrderRequestList;
// print(UserOrderList.length);
// _UserMyOrderState.len=UserOrderList.length;
  }

  @override
  _AdminOrderRequestState createState() => _AdminOrderRequestState();
}

class _AdminOrderRequestState extends State<AdminOrderRequest> {



  static List AdminOrderRequestList;
  //static FirebaseAuth auth;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Column(
          children: [
            Text(
                "Your Order Request",
                style: TextStyle(color: Colors.white)
            ),

          ],
        ),
      ),
      body:Container(
        child: AdminOrderRequestList.length==0
            ? new Text("no product available")
            : new ListView.builder(
            itemCount: AdminOrderRequestList.length,
            itemBuilder: (_, index) {
              return order_detail(
                  AdminOrderRequestList[index].product_name,AdminOrderRequestList[index].product_id,
                  AdminOrderRequestList[index].price,AdminOrderRequestList[index].name,AdminOrderRequestList[index].mobile,AdminOrderRequestList[index].area,AdminOrderRequestList[index].city,AdminOrderRequestList[index].state,AdminOrderRequestList[index].pincode

              );
            }),
      ),

    );

  }
  Widget order_detail(String shortInfo,String productId,String price,String name,String mobile,String area,String city,String state,String pincode)
  {return FittedBox(
    child: Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      child: Row(
        children: [
          // itemCake(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Product Detail:-'),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Product Name:'+shortInfo),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Product ID:'+productId),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Price:  ₹ '+price),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('  '),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Delivery Address:-'),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Name:'+name),
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Phone Number:'+mobile),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('Flat/House Number:'+area),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('City:'+city),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('State/Country:'+state),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text('PIN CODE:'+pincode),
                ),

              ],
            ),
          ),

        ],
      ),
    ),
  );

  }



}
