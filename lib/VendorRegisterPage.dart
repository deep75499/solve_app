//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'VendorLoginPage.dart';
//
// class VendorRegisterPage extends StatefulWidget
// {
//   @override
//   VendorRegisterPageState createState() => VendorRegisterPageState();
//
//
// }
//
//
//
// class VendorRegisterPageState extends State<VendorRegisterPage> {
//   DatabaseReference _vendorref=FirebaseDatabase.instance.reference().child('vendors');
//
//   GlobalKey<FormState> vendorsinupkey =  GlobalKey<FormState>();
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController vendorShopNameController = TextEditingController();
//
//   FirebaseAuth auth2=FirebaseAuth.instance;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       // backgroundColor: Colors.pink,
//       body: Stack(
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
//                 padding: EdgeInsets.only(top: 40.0),
//                 child: Text(
//                   "Vendor SignUp!",
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
//                 padding: EdgeInsets.only(top: 30.0),
//                 child: Stack(
//                   children: <Widget>[
//                     SingleChildScrollView(
//                       child: Container(
//
//                         width: 320.0,
//                         height: 800.0,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 65.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.transparent,
//                         ),
//                         child: Form(
//                           autovalidate: true,
//                           key: vendorsinupkey,
//                           child: Column(
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 15.0,
//                                 ),
//                                 child: TextFormField(
//                                     autofocus: false,
//                                     autocorrect: false,
//                                     controller: nameController,
//                                     style: TextStyle(
//                                       fontSize: 20.0,
//                                     ),
//                                     decoration: InputDecoration(
//                                       hintText: 'Username',
//                                       border: OutlineInputBorder(),
//                                       filled: true,
//                                       fillColor: Colors.transparent,
//                                       contentPadding: EdgeInsets.all(15.0),
//                                     ),
//                                     validator:(input)
//                                     {
//                                       if(input.isEmpty)
//                                       {
//                                         return 'type your full name';
//                                       }
//                                     }
//
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top:20.0),
//                                 child: TextFormField(
//                                     autofocus: false,
//                                     autocorrect: false,
//                                     obscureText: false,
//                                     controller: emailController,
//                                     style: TextStyle(
//                                       fontSize: 20.0,
//                                     ),
//                                     decoration: InputDecoration(
//                                       hintText: 'email',
//                                       border: OutlineInputBorder(),
//                                       filled: true,
//                                       fillColor: Colors.transparent,
//                                       contentPadding: EdgeInsets.all(15.0),
//                                     ),
//                                     validator:(input)
//                                     {
//                                       if(input.isEmpty)
//                                       {
//                                         return 'type an email';
//                                       }
//                                     }
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top:20.0),
//                                 child: TextFormField(
//                                   autofocus: false,
//                                   autocorrect: false,
//                                   obscureText: true,
//                                   controller: passwordController,
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Password',
//                                     border: OutlineInputBorder(),
//                                     filled: true,
//                                     fillColor: Colors.transparent,
//                                     contentPadding: EdgeInsets.all(15.0),
//                                   ),
//                                   validator:(input)
//                                   {
//                                     if(input.length<6)
//                                     {
//                                       return "password must be greater than 6 char";
//                                     }
//                                   },
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(top:20.0),
//                                 child: TextFormField(
//                                   autofocus: false,
//                                   autocorrect: false,
//                                   obscureText: true,
//                                   style: TextStyle(
//                                     fontSize: 20.0,
//                                   ),
//                                   decoration: InputDecoration(
//                                     hintText: 'Confirm Password',
//                                     border: OutlineInputBorder(),
//                                     filled: true,
//                                     fillColor: Colors.transparent,
//                                     contentPadding: EdgeInsets.all(15.0),
//                                   ),
//                                   validator:(input)
//                                   {
//                                     if(input.length<6)
//                                     {
//                                       return "password must be greater than 6 char";
//                                     }
//                                     if(input!=passwordController.text)
//                                     {
//                                       return "password must be same";
//                                     }
//                                   },
//                                 ),
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
//
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 10.0,
//                                 ),
//                                 child: MaterialButton(
//                                     onPressed:()
//                                     {
//                                       signUp();
//                                       addUser();
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
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 10.0,
//                                 ),
//                                 child: MaterialButton(
//                                     onPressed: (){
//                                       // Navigator.pop(context, MaterialPageRoute(
//                                       //     builder: (context) => VendorLoginPage()
//                                       // )
//                                       // );
//                                     },
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
//   Future<void> signUp() async
//   {
//
//     try {
//       await auth2.createUserWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//       // UserCredential userCredential = await auth.signInAnonymously();
//
//       //print(userCredential.user.uid);
//       // Navigator.pop(context,
//       //     MaterialPageRoute(builder: (context) => VendorLoginPage()));
//     }
//     on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }
//   void addUser()
//   {
//     String name=nameController.text;
//
//     String email=emailController.text;
//     String password=passwordController.text;
//
//     Map<String,String> vendors= {
//       'name':name,
//       'email':email,
//       'password':password,
//
//     };
//     _vendorref.push().set(vendors);
//
//   }
//
//   }
// //dialog box for successfully signedup
//
// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () {
//       // Navigator.pop(context, MaterialPageRoute(builder: (context) => VendorLoginPage()));
//       // Navigator.pop(context, MaterialPageRoute(builder: (context) => VendorLoginPage()));
//
//
//     },
//   );
//
//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Signed Successfully!"),
//     content: Text("Return to Vendor Login page"),
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
// }
