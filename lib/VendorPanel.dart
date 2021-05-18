import 'dart:io';
//import 'dart:wasm';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:solve_app/HelpPage.dart';
import 'package:solve_app/HomePage.dart';
import 'package:solve_app/LoginPage.dart';
import 'package:solve_app/UpdateProfilePage.dart';
import 'package:solve_app/VendorLoginPage.dart';
import 'package:solve_app/VendorOrderRequest.dart';
import 'package:solve_app/VendorProduct.dart';
//import 'lodingWidget.dart';
import 'AccountSetting.dart';
import 'VendorAccountSetting.dart';
import 'getProduct.dart';
import 'getUserOrder.dart';
import 'searchBox.dart';
import 'VendorLoginPage.dart';
import 'VendorOrder.dart';


class VendorPanel extends StatefulWidget {

VendorPanel()
{    DatabaseReference vendor_order=FirebaseDatabase.instance.reference().child('vendors').child(LoginScreenVendorState.auth2.currentUser.uid).child('order_request');

vendor_order.once().then((DataSnapshot snap) => _VendorPanelState.getOrderValue(snap));

}
  @override
  _VendorPanelState createState() => _VendorPanelState();
}

class _VendorPanelState extends State<VendorPanel>
{

    File _image;
   final picker=ImagePicker();
   String URL;
   TextEditingController _descriptionController = TextEditingController();
   TextEditingController _priceController = TextEditingController();
   TextEditingController _titleController = TextEditingController();
   TextEditingController _shortInfoController = TextEditingController();
   static String _productId = DateTime.now().millisecondsSinceEpoch.toString();
   bool uploading = false;
  static FirebaseAuth auth=LoginScreenVendorState.auth2;
  DatabaseReference _ref=FirebaseDatabase.instance.reference().child('products');

  DatabaseReference add_ref=FirebaseDatabase.instance.reference().child('vendors').child(auth.currentUser.uid).child('products').child(_productId);
    DatabaseReference get_ref=FirebaseDatabase.instance.reference().child('vendors').child(auth.currentUser.uid).child('products');

    // CollectionReference _ref = FirebaseFirestore.instance.collection('products');


    // V_ref.once().then((DataSnapshot snap) => getValue(snap));
    static  List<getProduct> vendorProductList =List();
    void getValue(DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      vendorProductList.clear();
      for (var individualKey in KEYS) {
        getProduct Product = new getProduct
          (
            DATA[individualKey]['description'],
            DATA[individualKey]['imageUrl'],
            DATA[individualKey]['price'],
            DATA[individualKey]['productId'],
            DATA[individualKey]['shortInfo'],
            DATA[individualKey]['title'],
            DATA[individualKey]['vendorUid'],
        );
        vendorProductList.add(Product);
        print(Product.title.toString());

      }
      print(vendorProductList.length);
      Navigator.push(context,MaterialPageRoute(builder: (context) =>VendorProduct(vendorProductList,auth)));
    }

    static List<getUserOrder> vendorOrderRequestList =List();
    static void getOrderValue(DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      vendorOrderRequestList.clear();
      for (var individualKey in KEYS) {
        getUserOrder Product = new getUserOrder
          (
          DATA[individualKey]['area'],
          DATA[individualKey]['city'],
          DATA[individualKey]['mobile'],
          DATA[individualKey]['name'],
          DATA[individualKey]['pincode'],
          DATA[individualKey]['price'],
          DATA[individualKey]['product_name'],
          DATA[individualKey]['product_id'],
          DATA[individualKey]['state'],
        );
        vendorOrderRequestList.add(Product);
        // print(Product.title.toString());

      }
      print(vendorOrderRequestList.length);
      print("helloo");
      print(vendorOrderRequestList[0].state);
     // Navigator.push(context,MaterialPageRoute(builder: (context) =>MyOrder()));

      //Navigator.push(context,MaterialPageRoute(builder: (context) =>UserWishList(UserProductList,auth)));
    }
   @override
  Widget build(BuildContext context) {
   return _image == null ? displayHomeScreen() : displayUploadVendorForm();
  }


    displayHomeScreen()
    {
        return  Scaffold(
      drawer: Drawer(
        child: ListView(
          children:<Widget> [
            UserAccountsDrawerHeader(
              
            //  accountName: Text("Harsh Shriwas"),
              accountEmail: Text(auth.currentUser.email),
              currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon
                    (
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
              ),
              ),
              
              ListTile(
                  
                  leading: Icon(Icons.home,color: Colors.teal,),
                  title: Text(
                    "HomePage",
                  ),
                  //icon: Icon(Icons.home),
                  onTap: (){
                    Navigator.pop(context,MaterialPageRoute(builder: (context) =>VendorPanel()));
                  },
              ),
              Divider(height:5,),
              ListTile(
                  
                  leading: Icon(Icons.person,color: Colors.teal,),
                  title: Text(
                    "My account",
                  ),
                  //icon: Icon(Icons.home),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>VendorAccountSetting(auth)));
                  },
              ),
              Divider(height:5,),
            ListTile(

              leading: Icon(Icons.person,color: Colors.teal,),
              title: Text(
                "My products",
              ),
              //icon: Icon(Icons.home),
              onTap: () async {
                try {
                  get_ref.once().then((DataSnapshot snap) => getValue(snap));
                }
                catch(e)
                {
                  print('no Product');
                  noProductDialog(context);                }

              },
            ),
            Divider(height:5,),
              ListTile(
                  
                  leading: Icon(Icons.shopping_basket, color: Colors.teal,),
                  title: Text(
                    "Order Request",
                  ),
                  //icon: Icon(Icons.home),
                  onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) =>VendorOrderRequest(vendorOrderRequestList)));

                  },
              ),

              Divider(height:5,),
              ListTile(
                  
                  leading: Icon(Icons.help, color: Colors.redAccent,),
                  title: Text(
                    "Help",
                  ),
                  //icon: Icon(Icons.home),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>HelpPage()));

                  },
              ),

              Divider(height:5,),
              ListTile(
                  
                  leading: Icon(Icons.logout, color: Colors.teal,),
                  title: Text(
                    "Logout",
                  ),
                  //icon: Icon(Icons.home),
                  onTap: (){

                    auth.signOut();
                    auth = null;
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>VendorLogin()));

                    if (auth == null) {
                      print("222222222222222222222222222");
                     // Navigator.pop(context, MaterialPageRoute(builder: (context) => VendorLoginPage()));
                    }
                  },
              ),

          ],
          
        ),
      ),
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
              onPressed: (){
                showSearch(context: context, delegate: Datasearch());
              },
            ),
            // IconButton
            // (
            //   icon: Icon(Icons.shopping_cart),
            //   color: Colors.white, 
            //   onPressed: (){}
            // ),
          ],
      ),
      body:  Container(
      //color: Colors.teal[200],
          child: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:20.0),
                  child: Text(
                    'Welcome To\nVendor Panel',
                    style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.teal,
                          ),  
                  ),
                ),
                Icon(Icons.shop_two, color:Colors.teal, size: 150.0),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: MaterialButton(
                                  onPressed: ()=> takeImage(context),
                                  color: Colors.teal,
                                  shape: StadiumBorder(),
                                  elevation: 20.0,
                                  hoverElevation: 40.0,
                                  splashColor: Colors.teal[400],
                                  height: 50.0,
                                  minWidth: 300.0,

                                  child: Text(
                                    "Add New Item",
                                      style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  )),
                ),

              ],
            )
          ),
        ),
    );
  }
   takeImage(mcontext){
    return showDialog(
      context: mcontext,
      builder: (con)
      {
        return SimpleDialog(
          title: Text('Upload Product Image',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Capture With Camera",style: TextStyle(color: Colors.tealAccent),),
              onPressed: _imgFromCamera,
            ),

            SimpleDialogOption(
              child: Text("Select From Gallery",style: TextStyle(color: Colors.tealAccent),),
              onPressed: _imgFromGallery,
            ),

            SimpleDialogOption(
              child: Text("Cancel",style: TextStyle(color: Colors.tealAccent),),
              onPressed: (){
                Navigator.pop(context);
              },
            ),

          ],
        );
      }
    );
  }
     Future _imgFromCamera() async
  {
      Navigator.pop(context);
      final image = await picker.getImage(source: ImageSource.camera);

      setState(() {
        _image = File(image.path);
      });
  }

  Future _imgFromGallery() async
  {
      Navigator.pop(context);
      final image = await picker.getImage(source: ImageSource.gallery);

     setState(() {
       _image = File(image.path);
      });
  }
  
  displayUploadVendorForm()
  {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        title:Text(
          'Product Description',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
          ),
        ),
       leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: clearFormInfo,),

      
        ),
        body: ListView(
          children: <Widget>[
           // uploading ? linearProgress() : Text(''),
            Container(
              height: 230.0,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(image: FileImage(_image),fit: BoxFit.contain)),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:12.0)),

              ListTile(
                leading: Icon(Icons.add_comment_outlined,color: Colors.black,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.black),
                      controller: _shortInfoController,
                      decoration: InputDecoration(
                        hintText: 'Short Info',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.black),

              ListTile(
                leading: Icon(Icons.add_comment_sharp,color: Colors.black,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.black),
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.black),
              
             ListTile(
                leading: Icon(Icons.add_comment,color: Colors.black,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      style: TextStyle(color:Colors.black),
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.black),

               ListTile(
                leading: Icon(Icons.account_balance_wallet_outlined,color: Colors.black,),
                title: Container(
                    width: 250.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color:Colors.black),
                      controller: _priceController,
                      decoration: InputDecoration(
                        hintText: 'Price in Rupee(₹)',
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                      
                    ),
                ),
              ),
              Divider(color:Colors.black),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: MaterialButton(
                  onPressed: (){
                    print(_shortInfoController.text);
                    print(_titleController.text);
                    print(_descriptionController.text);
                    print(_priceController.text);
                    print(_image);
                    print(_productId);
                    addProductImage();


                  },
                  color: Colors.teal,
                  shape: StadiumBorder(),
                  elevation: 20.0,
                  hoverElevation: 40.0,
                  splashColor: Colors.teal[400],
                  height: 50.0,
                  minWidth: 300.0,
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )),
            )

          ],
        ),
    );
  }
  
  clearFormInfo(){
    
    setState(() {
      _image = null;
      _descriptionController.clear();
      _priceController.clear();
      _shortInfoController.clear();
      _titleController.clear();
    });
  }
 Future<void> addProductImage() async
  { var timeKey=new DateTime.now();
 final Reference productImage= FirebaseStorage.instance.ref().child(_productId);
 UploadTask ut= productImage.putFile(_image);

await ut.whenComplete(() => addProduct());



  }

    showAlertDialog(BuildContext context) {
      // Create button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VendorPanel()));



        },
      );

      // Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Product Successfully Added!"),
        content: Text("Return to your home page"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    noProductDialog(BuildContext context) {
      // Create button
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VendorPanel()));



        },
      );

      // Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("No Product  Available!"),
        content: Text("Return to your home page"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    Future<void> addProduct() async
   {var url;
     try{
     Reference refer=FirebaseStorage.instance.ref().child(_productId);
      url=await refer.getDownloadURL();
     print(url);
     }
     catch( e)
     {

       print(e);
     }
     String imageUrl=url;
     String price=_priceController.text;
     String title=_titleController.text;
     String shortInfo=_shortInfoController.text;
     String description=_descriptionController.text;
     String productId=_productId;
     String vendorUid=auth.currentUser.uid;
     Map<String, Object> products= {
       'description':description,
       'imageUrl':imageUrl,
       'price':price,
       'productId':productId,
       'shortInfo':shortInfo,
       'title':title,
       'vendorUid':vendorUid,


     };
     _ref.push().set(products).whenComplete(() => showAlertDialog(context));

     add_ref.set({
       'description':description,
       'imageUrl':imageUrl,
       'price':price,
       'productId':productId,
       'shortInfo':shortInfo,
       'title':title,
       'vendorUid':vendorUid,
     }).whenComplete(() => print('product also added to your account you can check it'));
     _productId=DateTime.now().millisecondsSinceEpoch.toString();
   // _ref.add({
   //     'description':description,
   //     'imageUrl':imageUrl,
   //     'price':price,
   //     'productId':productId,
   //     'shortInfo':shortInfo,
   //     'title':title,
   // }).then((value) => print("vendor added his product successfully")).catchError((error) => print("Failed to add user: $error"));
   }
}