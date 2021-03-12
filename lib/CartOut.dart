import 'package:flutter/material.dart';
import 'CashOnDelivery.dart';
import 'LoginPage.dart';

class ChekOutPage extends StatefulWidget {
  @override
  _ChekOutPageState createState() => _ChekOutPageState();
}

class _ChekOutPageState extends State<ChekOutPage> {
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
      body:ListView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return Container(
              child: 
                Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('Name: Harsh Shriwas'),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('Phone Number: 7634643634'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('Flat/House Number: 102,Vijay Nagar'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('City: Indore'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('State/Country: MP,India'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('PIN CODE: 451212'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('Item Name: Teaddy Bear'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text('Price: \$23'),
                        ),
                         MaterialButton(
                           onPressed: (){
                             Navigator.push(
                              context, MaterialPageRoute(builder: (context) => CashOnDelivery())
                              );
                           },
                           color: Colors.teal,
                           textColor: Colors.white,
                           shape: StadiumBorder(),
                           child: Text('Buy Now'),
                         ),
                      ],
                    ) ,
                  ),
                ),
              
            );
          },
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
                          
//                           fontSize: 5.5,
//                           //color: Colors.redAccent
//                           ),
//                     ),
//                   ),
               
//                 ],
//               ),
//             ),
            
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
