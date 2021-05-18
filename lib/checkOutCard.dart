import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddressPage.dart';
import 'Cart2.dart';


class CheckoutCard extends StatefulWidget {
  CheckoutCard(List cartList,FirebaseAuth auth)
  {
    _CheckoutCardState.cartList=cartList;
    _CheckoutCardState.auth=auth;
   _CheckoutCardState.sumall();
  }
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  static List cartList;
static int priceSum=0;
static FirebaseAuth auth;
 static int sumall()
  {priceSum=0;
    int index=0;
  int n=cartList.length;
    while(index<n)
      {
        _CheckoutCardState.priceSum+=int.parse(cartList[index].price);
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
                    child:Text("Check Out"),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AddressPage(auth,cartList))
                      );
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
}