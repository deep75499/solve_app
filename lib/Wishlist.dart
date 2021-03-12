import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          children: [
            Text(
                "Your Wishlist",
                style: TextStyle(color: Colors.white)
            ),
            Text(
              "3 items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical:5.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: makeListTitle(context),
        ),
      ),
    );
  }

  ListTile makeListTitle(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    leading: Container(
      width: 120,
      alignment: Alignment.topLeft,
      child: Image.asset('assets/images/gift1.jpg',fit: BoxFit.contain,),

    ),
    title: Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        'Teady Bear',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
          //fontSize: 16.0,
        ),
      ),
    ),
    subtitle: Padding(
      padding: EdgeInsets.all(5),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Text(
            '\$44',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child:
          // ),
        ],
      ),
    ),
    trailing: Container(
      width:120,
      height: 120,
      child: Column(
        children: <Widget>[
          Expanded(
              child: MaterialButton(
                onPressed: (){},
                color: Colors.teal,
                textColor: Colors.white,
                shape: StadiumBorder(),
                child: Text('Buy Now'),
              )
          ),
          IconButton(
              icon: Icon(Icons.delete,color:Colors.teal),
              onPressed: (){}
          )
        ],

      ),
          ),
  );
}
