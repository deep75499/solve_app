import 'package:flutter/material.dart';
//import 'package:newproject/LoginVendor.dart';


class CashOnDelivery extends StatefulWidget {
  @override
  _CashOnDeliveryState createState() => _CashOnDeliveryState();
}

class _CashOnDeliveryState extends State<CashOnDelivery> {
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.6,
              width: double.infinity,
             // margin: const EdgeInsets.symmetric(horizontal: 12,),
              decoration: BoxDecoration(
                //borderRadius: Bor,
                image: DecorationImage(
                  
                  fit: BoxFit.contain,
                  
                  image: AssetImage('assets/images/cashondelivary.jpg'), 
                ),
              ),
              
            ),

            Container(
              height: MediaQuery.of(context).size.height/2.7,
              width: MediaQuery.of(context).size.width,
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: RaisedButton(
                padding: const EdgeInsets.all(16.0),
                elevation: 0,
                shape: StadiumBorder(),
                onPressed: (){
              //     Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => AddressPage())
              // );
                },
                color: Colors.white,
                child: Text('Place Your Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.redAccent),),                
              ),
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
