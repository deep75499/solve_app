import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage(String description, String image, String price,String productId, String shortInfo, String title)
  {
   _ProductDetailPageState.show(description,image,price,productId,shortInfo,title);
  }
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  static String description;
  static String image;
  static String price;
  static String productId;
  static String shortInfo;
  static String title;
  static void show(String description, String image, String price,String productId, String shortInfo, String title)
  {
    _ProductDetailPageState.description=description;
    _ProductDetailPageState.image=image;
    _ProductDetailPageState.price=price;
    _ProductDetailPageState.productId=productId;
    _ProductDetailPageState.shortInfo=shortInfo;
    _ProductDetailPageState.title=title;

  }


  // final product_name;
  // final product_newprice;
  // final product_oldprice;
  // final product_picture;

  // ProductDetailPage({

  //   this.product_name;
  //   this.product_newprice;
  //   this.product_oldprice;
  //   this.product_picture;

  // });

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
      body: ListView(
          children: <Widget>[
            Container(

              height: 300.0,
              child: GridTile(

                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color:Colors.white,
                  child:Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(image),
                  ),

                ),
                footer: Container(
                  color:Colors.white70,
                  child:ListTile(
                      leading:Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          fontSize: 16.0,
                        ),
                      ),
                      title: Row(
                        children:<Widget> [
                          Expanded(
                            child: Text(
                              '₹'+"10000",
                              style: TextStyle(
                                  color:Colors.grey,
                                  decoration: TextDecoration.lineThrough
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "₹"+price,
                              style: TextStyle(
                                  color:Colors.teal,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                title: Text(
                  'Product Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                subtitle: Text(description),
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[

                //Divider(),
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
                    icon: Icon(Icons.add_shopping_cart,color:Colors.teal),
                    onPressed: (){}
                ),
                IconButton(
                    icon: Icon(Icons.favorite_border,color:Colors.teal),
                    onPressed: (){}
                )
              ],
            )
          ]
      ),
    );
  }
}