import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Authentication.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'VendorLoginPage.dart';
import 'getProduct.dart';
import 'dart:core';

import 'getUserOrder.dart';

 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>
  with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.1,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/vocal2.png'),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 300,
                    child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.red,
                        tabs: <Widget>[
                          Tab(
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20))),
                          Tab(
                              child: Text("Sign-Up",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20))),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  LoginScreen(),
                  SignScreen(),
                          ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
  }

  class LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> loginkey =  GlobalKey<FormState>();
  static FirebaseAuth auth=FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void validate()
  {
  if(loginkey.currentState.validate())
  {
  print('ok here');
  signIn();
  }
  else
  print("Not A valid");
  }

  Future<void> signIn() async
  {
  try {
  await auth.signInWithEmailAndPassword(
  email: emailController.text,password: passwordController.text);
  // UserCredential userCredential = await auth.signInAnonymously();
  //print(userCredential.user.uid);
  if(emailController.text!=null){

    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage(emailController.text,auth,getProductList)));
  }
  else
  {print('hgjhggggggggggggggggggggggggggggggggggggggggg');
  //showAlertDialog(context);
  }

  // final hp= HomePage();
  // hp.aalu(emailController.text, auth);
  }
  catch(e){
  print(e);
  }

  }
  LoginScreenState() {
    DatabaseReference getProductRef = FirebaseDatabase.instance.reference()
        .child('products');
    getProductRef.once().then((DataSnapshot snap) => getValue(snap));


  }




  static  List<getProduct> getProductList =List();
  void getValue(DataSnapshot snap) {
    var KEYS = snap.value.keys;
    var DATA = snap.value;
    getProductList.clear();
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
      getProductList.add(Product);
      print(Product.title.toString());

    }
    print(getProductList.length);
  }


  String validatePassword(value)
  {

  if(value.isEmpty)
  {
  return "Required";
  }
  else if(value.length < 6)
  {
  return "password is grater than 6";
  }
  else if(value.length > 15)
  {
  return "password is less than 15";
  }
  else{
  return null;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 490,
      // color: Colors.black54,
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              autovalidate: true,
              key: loginkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      icon: Icon(Icons.email),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "Not a valid Email"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock),
                        suffixIcon: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot?..",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                      validator: validatePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          validate();
                        },
                        color: Colors.teal,
                        shape: StadiumBorder(),
                        elevation: 20.0,
                        hoverElevation: 40.0,
                        splashColor: Colors.teal[400],
                        height: 50.0,
                        minWidth: 300.0,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VendorLogin()));
                        },
                        color: Colors.teal,
                        shape: StadiumBorder(),
                        elevation: 20.0,
                        hoverElevation: 40.0,
                        splashColor: Colors.teal[400],
                        height: 50.0,
                        minWidth: 300.0,
                        child: Text(
                          "Vender Login",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        )),
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  class SignScreen extends StatefulWidget
  {
  @override
  _SignScreenState createState() => _SignScreenState();
  }

  class _SignScreenState extends State<SignScreen> {


  GlobalKey<FormState> Signkey =  GlobalKey<FormState>();
  GlobalKey<FormState> sinupkey =  GlobalKey<FormState>();
 // TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  static String uid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 490,
      // color: Colors.black54,
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              autovalidate: true,
              key: Signkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      icon: Icon(Icons.email),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required"),
                        EmailValidator(errorText: "Not a valid Email"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      validator: validatePassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "confirm Password",
                        icon: Icon(Icons.lock),
                      ),
                      validator: (input) {
                        if (input.length < 6) {
                          return "password must be greater than 6 char";
                        }
                        if (input != passwordController.text) {
                          return "password must be same";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: MaterialButton(
                        onPressed: () {
                          validate();
                        },
                        color: Colors.teal,
                        shape: StadiumBorder(),
                        elevation: 20.0,
                        hoverElevation: 40.0,
                        splashColor: Colors.teal[400],
                        height: 50.0,
                        minWidth: 300.0,
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signUp() async
  {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // UserCredential userCredential = await auth.signInAnonymously();
      uid=auth.currentUser.uid;
      //print(userCredential.user.uid);
      addUser();
      showAlertDialog(context);
      // Navigator.pop(context,
      //     MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  void addUser()
  {
   // String name=nameController.text;
    String email=emailController.text;
    String password=passwordController.text;
    Map<String,String> users= {

      'email':email,
      'password':password,
    };
    DatabaseReference _ref=FirebaseDatabase.instance.reference().child('users').child(uid).child('auth_detail');
    _ref.push().set(users).whenComplete(() => print('user created with uid and inside that auth detail have the detail'));
  }

  void validate()
  {
  if(Signkey.currentState.validate()){
  print('ok');
  signUp();
 // addUser();
  }
  else
  print("Not A valid");
  }


  String validatePassword(value)
  {

  if(value.isEmpty)
  {
  return "Required";
  }
  else if(value.length < 6)
  {
  return "password is grater than 6";
  }
  else if(value.length > 15)
  {
  return "password is less than 15";
  }
  else{
  return null;
  }
  }



  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));



      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Signed Successfully!"),
      content: Text("Return to Login page"),
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


  }