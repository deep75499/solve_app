import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solve_app/ConfirmOrder.dart';
import 'CashOnDelivery.dart';
import 'LoginPage.dart';
import 'checkOutCard.dart';

class CheckOutPage extends StatefulWidget
{
  CheckOutPage(String name,String mobile,String area,String city,String state,String pincode,List cartList,FirebaseAuth auth)
  {_CheckOutPageState.auth=auth;
    _CheckOutPageState.name=name;
    _CheckOutPageState.mobile=mobile;
    _CheckOutPageState.area=area;
    _CheckOutPageState.city=city;
    _CheckOutPageState.state=state;
    _CheckOutPageState.pincode=pincode;
    _CheckOutPageState.cartList=cartList;

  }
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  static FirebaseAuth auth;
  static String name;
  static String mobile;
  static String area;
  static String city;
  static String state;
  static String pincode;
  static List cartList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          children: [
            Text(
              "Chekout",
              style: TextStyle(color: Colors.white)
            ),
           
          ],
        ),
      ),
      body:Container(
        child: cartList.length == 0
            ? new Text("no product available")
            : new ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (_, index) {
              return order_detail(
                cartList[index].shortInfo,cartList[index].productId,
                cartList[index].price,name,mobile,area,city,state,pincode

              );
            }),
      ),

      bottomNavigationBar:CofirmOrderCard(cartList,auth),
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
                child: Text('Deliver Address:-'),
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
//    Widget foodCart() {
//     return FittedBox(
//       child: Card(
//         elevation: 15,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
//         child: Row(
//           children: [
//             // itemCake(),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Text(
//                       "Teady Bear",
//                       style: TextStyle(
//
//                           fontSize: 5.5,
//                           //color: Colors.redAccent
//                           ),
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Text(
//                       "Teady Bear",
//                       style: TextStyle(
//
//                           fontSize: 5.5,
//                           //color: Colors.redAccent
//                           ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     child: Text(
//                       "Teady Bear",
//                       style: TextStyle(
//
//                           fontSize: 5.5,
//                           //color: Colors.redAccent
//                           ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 1),
//                     child: Text(
//                       "Teady Bear",
//                       style: TextStyle(
//
//                           fontSize: 5.5,
//                           //color: Colors.redAccent
//                           ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }


  // ListTile makeListTitle(BuildContext context) => ListTile(
  //       contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  //       leading: Container(
  //         width: 50,
  //         height: 150,
  //         alignment: Alignment.center,
  //         child: Container(),
  //       ),
        // title: Padding(
        //   padding: EdgeInsets.all(5),
        //   child: Text(
        //     'Teady Bear',
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Colors.redAccent,
        //       //fontSize: 16.0,
        //     ),
        //   ),
        // ),
        // subtitle: Padding(
        //   padding: EdgeInsets.all(5),
        //   child: Wrap(
        //     direction: Axis.vertical,
        //     children: <Widget>[
        //       Text(
        //         '\$44',
        //         style: TextStyle(
        //             color: Colors.grey, 
        //       ),
        //       ),
        //       // Align(
        //       //   alignment: Alignment.center,
        //       //   child: 
        //       // ),
        //     ],
        //   ),
        // ),
        // trailing: Container(
        //   width:120,
        //   child: FlatButton(
        //           onPressed: (){},
        //           padding: EdgeInsets.all(5),
        //           color: Colors.redAccent,
        //           shape: StadiumBorder(),

        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             children: <Widget>[
        //               Icon(
        //                 Icons.delete,
        //                 color: Colors.white,
        //               ),
                      
        //               Text(
        //                 'Remove',
        //                 style: TextStyle(
        //                 color: Colors.white, 
        //               ),
        //               ),
                       
        //             ],
        //           ),
                  
        //         ),
                
        // ),
      
      
     
}
