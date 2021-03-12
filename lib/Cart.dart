import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          children: [
            Text(
                "Your Cart",
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
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
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
      width: 50,
      height: 150,
      alignment: Alignment.center,
      child: Image.asset('assets/images/gift1.jpg'),
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
      child: FlatButton(
        onPressed: (){},
        padding: EdgeInsets.all(5),
        color: Colors.redAccent,
        shape: StadiumBorder(),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),

            Text(
              'Remove',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),

      ),
    ),
  );
}
