import 'package:flutter/material.dart';
import 'AddressPage.dart';


final priceTextStyle = TextStyle(
                 color: Colors.grey.shade400,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               );

class Cart2 extends StatefulWidget {
  @override
  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:Text(
          'Gift Basket',
          
        ),
        actions: <Widget>[
            IconButton(
                icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: (){},
            ),
            IconButton
            (
              icon: Icon(Icons.shopping_cart),
              color: Colors.white, 
              onPressed: (){}
            ),
          ],
     ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: double.maxFinite,
            width: 80,
              child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 25.0, 16.0, 16.0),
            children: [
              Text('My Order',style:TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
              const SizedBox(height: 40.0,),
              CartListItem(
                  items: CartItem(
                    title: "Pizza",
                    qty: 2,
                    price: 12,
                    bgcolor: Colors.deepOrange,
                    //image: 
                ),
              ),
              // const SizedBox(height: 20.0,),
              // CartListItem(
              //     items: CartItem(
              //       title: "Pizza2",
              //       qty: 1,
              //       price: 12,
              //       bgcolor: Colors.deepOrange,
              //       //image: 
              //   ),
              // ),
              const SizedBox(height: 20.0,),
              CartListItem(
                  items: CartItem(
                    title: "Pizza3",
                    qty: 3,
                    price: 12,
                    bgcolor: Colors.deepOrange,
                    //image: 
                ),
              ),
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
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddressPage())
              );
                },
                color: Colors.yellow.shade700,
                child: Text('CheckOut',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),                
              ),
            ],
          ),
        ],
      ),

    );
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
}

class CartItem {
    final String title;
    final int qty;
    final double price;
    final String image;
    final Color bgcolor;

  CartItem({this.title,this.qty,this.price,this.image,this.bgcolor});    
}

class CartListItem extends StatelessWidget {
  final CartItem items;

  const CartListItem({Key key, this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: items.bgcolor,
              borderRadius: BorderRadius.circular(20.0),

            ),
            child: Image.asset('assets/images/gift1.jpg',fit: BoxFit.cover,), //items.image != null ? Image.network(items.image) : null, 
          ),
          const SizedBox(width: 20.0),
          Expanded(
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              children: [
               Text(items.title,style: TextStyle(
                 color: Colors.black,
                 fontSize: 10.0,
                 fontWeight: FontWeight.bold
               ),),
               const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                        IconButton(
                          iconSize: 18.0,
                          padding:  const EdgeInsets.all(2.0),
                          icon: Icon(Icons.remove),
                          onPressed: (){},
                        ),
                        Text("${items.qty}" ,style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),),
                        IconButton(
                          iconSize: 18.0,
                          padding:  const EdgeInsets.all(2.0),
                          icon: Icon(Icons.add),
                          onPressed: (){},
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
           const SizedBox(width: 10.0),
              Text("\$${items.price + items.qty}" , 
              style: priceTextStyle,
              ),
        ],
      ),
    );
  }
}