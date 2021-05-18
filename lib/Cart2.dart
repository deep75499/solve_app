import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'AddressPage.dart';
import 'checkOutCard.dart';

class Cart2 extends StatefulWidget {

  Cart2(FirebaseAuth auth,List cartList)
  {
    _Cart2State.auth=auth;
    _Cart2State.cartList=cartList;
  }
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  static FirebaseAuth auth;
  static List cartList;
 static DatabaseReference rem_ref=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('cart');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gift Basket"),
        backgroundColor: Colors.teal,
      ),
      body: getBody(),
     bottomNavigationBar: CheckoutCard(cartList,auth),

    );
  }

  final priceTextStyle = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  Widget getBody() {
    return Container(
       child: cartList.length == 0
    ? new Text("no product available")
        : new ListView.builder(
    itemCount: cartList.length,
    itemBuilder: (_, index) {
    return foodCart(
    cartList[index].shortInfo,
    cartList[index].price,cartList[index].imageUrl,cartList[index].productId,

    );
    }),
    );
  }
}
void remove(String productId)
{
  _Cart2State.rem_ref.child(productId).remove().whenComplete(() => print("item removed from cart"));

}

Container _buildDivider() {
  return Container(
    height:2.0,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}
Widget last()
{
  final priceTextStyle = TextStyle(
    color: Colors.grey.shade400,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height:20.0),
          _buildDivider(),
          const SizedBox(height:20.0),
          Row(
            children: [
              const SizedBox(height:40.0),
              Text("VAT (10%)",style: priceTextStyle,),
              Spacer(),
              Text("\$2",style: priceTextStyle),
              const SizedBox(height:20.0,),
            ],
          ),
          const SizedBox(height:20.0),
          _buildDivider(),
          const SizedBox(height:10.0),
          Row(
            children: [
              const SizedBox(height:20.0),
              Text("TOTAL",style: priceTextStyle.copyWith(color: Colors.black),),
              Spacer(),
              Text("\$49",style: priceTextStyle.copyWith(color:Colors.indigo)),
              const SizedBox(height:20.0,),
            ],
          ),
          const SizedBox(height: 10.0),
          RaisedButton(
            padding: const EdgeInsets.all(16.0),
            elevation: 0,

            shape: StadiumBorder(),
            onPressed: (){
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => AddressPage())
              // );
            },
            color: Colors.yellow.shade700,
            child: Text('CheckOut',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          ),
        ],
      ),
    ),
  );

}

Widget foodCart(String shortInfo,String price,String imageUrl,String productId
) {
  return FittedBox(
    child: Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ProductDetailPage()));
        },
        child: Row(
          children: [
            // itemCake(),
            Container(
              width: 90,
              height: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                  image: NetworkImage(imageUrl),
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
                      shortInfo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.redAccent),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text("Price: "
                    "₹"+price,
                      style: TextStyle(

                          fontSize: 15,
                          color: Colors.black87),
                    ),
                  ),

                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text("Qty:"),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.remove,
                          size: 15.0,
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
                        child: Text("1"),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          size: 15.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      FlatButton(
                        onPressed: (){
                          remove(productId);
                        },
                        height: 13.0,
                        minWidth: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text("Remove from cart",style: TextStyle(color: Colors.white,fontSize: 12),),

                          ],
                        ),
                        padding: EdgeInsets.all(8),
                        color: Colors.redAccent,
                        shape: StadiumBorder(),

                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
