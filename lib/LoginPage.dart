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


//
// class LoginPage extends StatefulWidget{
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
//
// GlobalKey<FormState> _loginkey =  GlobalKey<FormState>();
//
// //AuthenticationState authentication=new AuthenticationState();
// class _LoginPageState extends State<LoginPage>{
//
//   static FirebaseAuth auth=FirebaseAuth.instance;
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//
//
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       // backgroundColor: Colors.pink,
//       body: Stack(
//
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/bag.jpeg',
//             fit: BoxFit.cover,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 50.0),
//                 child: Text(
//                   "Login!",
//                   style: TextStyle(
//                     fontSize: 40.0,
//                     color: Colors.teal,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               )
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(top: 50.0),
//                 child: Stack(
//                   children: <Widget>[
//                     SingleChildScrollView(
//                       child: Container(
//                         width: 320.0,
//                         height: 500.0,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 25.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                         ),
//                         child: Form(
//                           autovalidate: true,
//                           key:_loginkey,
//
//                           child:  Column(
//                             children: <Widget>[
//                               Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 25.0,
//                                   ),
//                                   child: TextFormField(
//                                     autofocus: false,
//                                     autocorrect: true,
//                                     controller: emailController,
//                                     validator: (input)
//                                     {
//                                       if(input.isEmpty){
//                                         return 'please type an email';}
//
//                                     },
//
//                                     style: TextStyle(
//                                       fontSize: 20.0,
//                                     ),
//
//                                     decoration: InputDecoration(
//                                       hintText: 'Username',
//                                       border: OutlineInputBorder(),
//                                       filled: true,
//                                       fillColor: Colors.transparent,
//                                       contentPadding: EdgeInsets.all(15.0),
//                                     ),
//
//                                   )
//                               ),
//                               TextFormField(
//                                 autofocus: false,
//                                 autocorrect: false,
//                                 obscureText: true,
//                                 controller: passwordController,
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: 'Password',
//                                   border: OutlineInputBorder(),
//                                   filled: true,
//                                   fillColor: Colors.transparent,
//                                   contentPadding: EdgeInsets.all(15.0),
//                                 ),
//                                 validator: (input){
//                                   if(input.length<6) {
//                                     return 'password must be atleast 6 char';
//                                   }
//
//                                 },
//
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   FlatButton(
//                                     onPressed: (){},
//                                     child: Text(
//                                       "Forgot Password?..",
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.teal,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   FlatButton(
//                                     onPressed: () {
//                                       Navigator.push(context, MaterialPageRoute(
//                                           builder: (context) => VendorLoginPage()
//                                       )
//                                       );
//                                     },
//                                     child: Text(
//                                       "VENDOR LOGIN",
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.teal,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 20.0,
//                                 ),
//                                 child: MaterialButton(
//                                     onPressed:()=>signIn(),
//                                     color: Colors.teal,
//                                     shape: StadiumBorder(),
//                                     elevation: 20.0,
//                                     hoverElevation: 40.0,
//                                     splashColor: Colors.teal[400],
//                                     height: 50.0,
//                                     minWidth: 300.0,
//                                     child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         color: Colors.white,
//                                       ),
//                                     )),
//                               ),
//
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 20.0,
//                                 ),
//                                 child: MaterialButton(
//                                     onPressed: () {
//                                       Navigator.push(context, MaterialPageRoute(
//                                           builder: (context) => RegisterPage()
//                                       )
//                                       );
//                                     },
//                                     color: Colors.teal,
//                                     shape: StadiumBorder(),
//                                     elevation: 20.0,
//                                     hoverElevation: 40.0,
//                                     splashColor: Colors.teal[400],
//                                     height: 50.0,
//                                     minWidth: 300.0,
//                                     child: Text(
//                                       "SignUp",
//                                       style: TextStyle(
//                                         fontSize: 20.0,
//                                         color: Colors.white,
//                                       ),
//                                     )),
//                               ),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//
//   Future<void> signIn() async
//   {
// try {
//   auth.signInWithEmailAndPassword(
//       email: emailController.text, password:passwordController.text);
//   // UserCredential userCredential = await auth.signInAnonymously();
//   //print(userCredential.user.uid);
//   if(emailController.text!=null)
//   Navigator.push(context,
//       MaterialPageRoute(builder: (context)=>HomePage(emailController.text,auth)));
//   else
//     {
//       showAlertDialog(context);
//     }
//
//         // final hp= HomePage();
//         // hp.aalu(emailController.text, auth);
//
//
//
// }
// catch(e){
//       print(".^^^^^^^^^^^^^^^^^^^^");
//     }
//
//   }
//
//
//
//
//
// }
//
// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage()));
//
//
//     },
//   );
//
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Login Unsuccessful!"),
//     content: Text("Invalid email or password!\nReturn to Login page"),
//     actions: [
//       okButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>
  with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState(){
  super.initState();
  _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
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
  height: MediaQuery.of(context).size.height/2.1,
  width: double.infinity,
  margin: const EdgeInsets.symmetric(horizontal: 12,),
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
  children:[
  SizedBox(
  height: 40,
  width: 300,
  child: TabBar(

  controller: _tabController,
  indicatorColor: Colors.red,
  tabs: <Widget>[
  Tab(child: Text("Login",style: TextStyle(color:Colors.red,fontSize: 20))),
  Tab(child: Text("Sign-Up",style: TextStyle(color:Colors.red,fontSize: 20))),

  ]
  ),
  ),
  ],
  ) ,
  ),

  Container(
  height: MediaQuery.of(context).size.height/1.9,
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
  _LoginScreenState createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> loginkey =  GlobalKey<FormState>();
  static FirebaseAuth auth=FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void validate()
  {
  if(loginkey.currentState.validate()) {

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
  if(emailController.text!=null)
  Navigator.push(context,
  MaterialPageRoute(builder: (context)=>HomePage(emailController.text,auth)));
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
  padding:const EdgeInsets.all(16),
  child: Padding(
  padding: const EdgeInsets.only(top: 1),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children:[

  Form(

  autovalidate: true,
  key: loginkey,
  child: Column(
  children:[
  TextFormField(
  keyboardType: TextInputType.emailAddress,
  controller: emailController,
  decoration: InputDecoration(
  hintText: "Email Address",
  icon:Icon(Icons.email),
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
  icon:Icon(Icons.lock),
  suffixIcon:   FlatButton(
  onPressed: (){},
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
  onPressed: (){
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
  onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) => VendorLogin()));
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
  )
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  class SignScreen extends StatefulWidget
  {
  @override
  _SignScreenState createState() => _SignScreenState();
  }

  class _SignScreenState extends State<SignScreen> {

  GlobalKey<FormState> Signkey =  GlobalKey<FormState>();
  DatabaseReference _ref=FirebaseDatabase.instance.reference().child('users');
  GlobalKey<FormState> sinupkey =  GlobalKey<FormState>();
 // TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;

  Future<void> signUp() async
  {

    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // UserCredential userCredential = await auth.signInAnonymously();

      //print(userCredential.user.uid);
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
      'name':null,
      'email':email,
      'password':password,
    };
    _ref.push().set(users);
  }

  void validate()
  {
  if(Signkey.currentState.validate()){
  print('ok');
  signUp();
  addUser();

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


  @override
  Widget build(BuildContext context) {
  return Container(

  width: 200,
  height: 490,
  // color: Colors.black54,
  padding:const EdgeInsets.all(16),
  child: Padding(
  padding: const EdgeInsets.only(top: 1),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children:[

  Form(

  autovalidate: true,
  key: Signkey,
  child: Column(
  children:[
  TextFormField(
  keyboardType: TextInputType.emailAddress,
  controller: emailController,
  decoration: InputDecoration(
  hintText: "Email Address",
  icon:Icon(Icons.email),
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
  icon:Icon(Icons.lock),


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
  icon:Icon(Icons.lock),


  ),
    validator:(input)
    {
      if(input.length<6)
      {
        return "password must be greater than 6 char";
      }
      if(input!=passwordController.text)
      {
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
  onPressed: (){
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