import 'package:flutter/material.dart';

class UserOrderList extends StatefulWidget {
  @override
  _UserOrderListState createState() => _UserOrderListState();
}

class _UserOrderListState extends State<UserOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              width: 400.0,
              height: 550.0,
              decoration: BoxDecoration(border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),),
              
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Order No : #3546',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                   ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Product Details: ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                  ),

                   Row(
                    children: [

                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Container(
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),),

                          child: Center(child: Text('image')),
                          
                        ),
                      ),

                      // Padding(
                      //   padding:EdgeInsets.only(top:1.0),
                      //   child: 
                      Text('Syska Trimmer ',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),),
                      // ),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Shipping Address: ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                  ),

                   Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left:15.0),
                        child: Text('Rajesh Khanna\nB-24 Sapna Sangeeta,Indore\nMobile No: 9876543210',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),),
                      ),
                    ],
                  ),


                   Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Payment Status :',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),
                        ),
                      ),

                      

                      Text('Online (Debited)',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.green,
                      ),),
                    ],
                  ),

                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Delivery Status :',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),
                        ),
                      ),

                      

                      Text('Delivered (1/1/2020)',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.green,
                      ),),
                    ],
                  ),
                  

                  Row(
                    children: [
                      Padding(
                        padding:EdgeInsets.all(15.0),
                        child: Text('Order Date :',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .8,
                        ),
                        ),
                      ),

                      

                      Text('12/12/2020',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.green,
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}