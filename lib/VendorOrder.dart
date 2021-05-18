import 'package:flutter/material.dart';
import 'OrderList.dart';

class MyOrder extends StatefulWidget {
  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('My Order'),
        ),
        body: ListView(
          children: [
            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'New Order Received',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),

            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'New Order Received',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),
            
            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Delivered',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),
            
            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Delivery in progress',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),
            
            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'New Order Received',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
            
                ),
              ),
            ),
            
            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Delivered',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ), 


            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Delivered',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),

            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'New Order Received',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),

            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Delivered',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),

            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Cancelled',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),

            Padding(                
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100.0,
                height: 40.0,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Order Delivered',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: (){
                        Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderList())
              );
                  },
                ),
              ),
            ),         
            
            ],
        ));
  }
}
