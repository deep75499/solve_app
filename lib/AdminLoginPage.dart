import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';
import 'AdminPanel.dart';

import 'dart:core';
//
// class AdminLoginPage extends StatefulWidget
// {
//   @override
//   AdminLoginPageState createState() => AdminLoginPageState();
//
//
//   }
//
//
//
// class AdminLoginPageState extends State<AdminLoginPage> {
//
//
//   GlobalKey<FormState> _Adminloginkey =  GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   static FirebaseAuth auth2=FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context)
//   {return Scaffold(
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
//                           key:_Adminloginkey,
//
//                           child:  Column(
//                             children: <Widget>[
//                               Padding(
//                                   padding: EdgeInsets.symmetric(
//                                     vertical: 25.0,
//                                   ),
//                                   child: TextFormField(
//                                     autofocus: false,
//                                     autocorrect: false,
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
//                                       hintText: 'Admin Username',
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
//
//
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 20.0,
//                                 ),
//                                 child: MaterialButton(
//                                     onPressed:()=>AdminsignIn(),
//                                     color: Colors.teal,
//                                     shape: StadiumBorder(),
//                                     elevation: 20.0,
//                                     hoverElevation: 40.0,
//                                     splashColor: Colors.teal[400],
//                                     height: 50.0,
//                                     minWidth: 300.0,
//                                     child: Text(
//                                       "Admin Login",
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
//                                           builder: (context) => AdminRegisterPage()
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
//                                       "Admin SignUp",
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
//   Future<void> AdminsignIn() async
//   {
//     try {
//       auth2.signInWithEmailAndPassword(
//           email: emailController.text, password:passwordController.text);
//       // UserCredential userCredential = await auth.signInAnonymously();
//
//       //print(userCredential.user.uid);
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => AdminPanel()));
//     }
//     catch(e){
//       print(".^^^^^^^^^^^^^^^^^^^^");
//     }
//
//   }
//
// }

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin>
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
                  fit: BoxFit.contain,
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
                          Tab(child: Text("Login",style: TextStyle(color:Colors.red,fontSize: 20),)),
                          Tab(child: Text("Sign-Up",style: TextStyle(color:Colors.red,fontSize: 20),)),

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
                  LoginScreenAdmin(),
                  V_SignScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreenAdmin extends StatefulWidget {
  @override
  LoginScreenAdminState createState() => LoginScreenAdminState();
}

class LoginScreenAdminState extends State<LoginScreenAdmin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   static FirebaseAuth auth2=FirebaseAuth.instance;
  GlobalKey<FormState> loginkey =  GlobalKey<FormState>();

  Future<void> AdminsignIn() async
  {
    try {
      auth2.signInWithEmailAndPassword(
          email: emailController.text, password:passwordController.text);
      // UserCredential userCredential = await auth.signInAnonymously();

      //print(userCredential.user.uid);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AdminPanel()));
    }
    catch(e){
      print(".^^^^^^^^^^^^^^^^^^^^");
    }

  }
  void validate()
  {
    if(loginkey.currentState.validate()){
      print('ok');
    AdminsignIn();}
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
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
              padding: const EdgeInsets.only(top: 32),
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
                        color: Colors.purple,
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
                  color: Colors.purple,
                  shape: StadiumBorder(),
                  elevation: 20.0,
                  hoverElevation: 40.0,
                  splashColor: Colors.purple[400],
                  height: 50.0,
                  minWidth: 300.0,
                  child: Text(
                    "Admin Login",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.0,
              ),
              child: MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  color: Colors.purple,
                  shape: StadiumBorder(),
                  elevation: 20.0,
                  hoverElevation: 40.0,
                  splashColor: Colors.purple[400],
                  height: 50.0,
                  minWidth: 300.0,
                  child: Text(
                    "User Login",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  )),
            )

          ],
        ),
      ),],),),
    );

  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class V_SignScreen extends StatefulWidget {
  @override
  V_SignScreenState createState() => V_SignScreenState();
}

class V_SignScreenState extends State<V_SignScreen> {

  GlobalKey<FormState> V_Signkey =  GlobalKey<FormState>();



  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController AdminShopNameController = TextEditingController();
  static String uid;
  FirebaseAuth auth2=FirebaseAuth.instance;
  Future<void> signUp() async
  {
    try {
      await auth2.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // UserCredential userCredential = await auth.signInAnonymously();
      uid=auth2.currentUser.uid;
      print(uid);
      DatabaseReference _Adminref=FirebaseDatabase.instance.reference().child('Admins').child(uid);
      addUser(_Adminref);
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) =>AdminLogin()));
      showAlertDialog(context);
    }
    on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// DatabaseReference _Adminref=FirebaseDatabase.instance.reference().child('Admins').child(uid);

  void addUser(DatabaseReference _Adminref)
  {
   // String name=nameController.text;
    String email=emailController.text;
    String password=passwordController.text;
    Map<String,String> Admins= {
     'name':null,
      'email':email,
      'password':password,
    };
    _Adminref.push().set(Admins);
  }

  void validate()
  {
    if(V_Signkey.currentState.validate()){
      print('ok');
      signUp();

    }
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              autovalidate: true,
              key: V_Signkey,
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
                        color: Colors.purple,
                        shape: StadiumBorder(),
                        elevation: 20.0,
                        hoverElevation: 40.0,
                        splashColor: Colors.purple[400],
                        height: 50.0,
                        minWidth: 300.0,
                        child: Text(
                          "Admin SignUp",
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
         Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin()));


      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Signed Successfully!"),
      content: Text("Return to Admin Login page"),
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