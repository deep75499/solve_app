import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solve_app/AccountSetting.dart';
import 'CheckProfile.dart';

class UpdateProfilePage extends StatefulWidget
{
  UpdateProfilePage(FirebaseAuth auth)
  {
    _UpdateProfilePageState.auth=auth;
  }
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage>
{
  static FirebaseAuth auth;
  DatabaseReference add_prof=FirebaseDatabase.instance.reference().child('users').child(auth.currentUser.uid).child('profile').child(auth.currentUser.uid);
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController areaController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  TextEditingController pincodeController=TextEditingController();

  File _image;
  final picker=ImagePicker();

  final _formKey = GlobalKey<FormState>();

  void validate()
  {
    if(_formKey.currentState.validate())
    {
      print('ok here');
      print(nameController.text);
      print(emailController.text);
      print(mobileController.text);
      print(stateController.text);
      addProductImage();
    }
    else
      print("Not A valid");
  }
  Future<void> addProductImage() async
  { var timeKey=new DateTime.now();
  final Reference productImage= FirebaseStorage.instance.ref().child(auth.currentUser.uid);
  UploadTask ut= productImage.putFile(_image);

  await ut.whenComplete(() => addProfile());



  }
  void addProfile() async{
    var url;
    try{
      Reference refer=FirebaseStorage.instance.ref().child(auth.currentUser.uid);
      url= await refer.getDownloadURL();
      print(url);
    }
    catch( e)
    {

      print(e);
    }

     String profilePic = url;
    String name=nameController.text;
    String mobile=mobileController.text;
    String area=areaController.text;
    String city=cityController.text;
    String state=stateController.text;
    String pincode=pincodeController.text;
    Map<String, Object> profile_detail= {
      'area':area,
      'city':city,
      'mobile':mobile,
      'name':name,
      'pincode':pincode,
      'profilePic':profilePic,
      'state':state,
    };
    add_prof.set(profile_detail).whenComplete(() => showAlertDialog(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: ListView(

        children: [
          Padding(
            padding: EdgeInsets.only(top:12.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage:_image==null?AssetImage('assets/images/vocal2.png'):FileImage(File(_image.path)),
                child: Container(
                //  decoration :BoxDecoration(image: DecorationImage(image: FileImage(_image),fit: BoxFit.contain)),
                  ),

                radius: 80.0,
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ),

          Positioned(
            right: 0,
              bottom: 0,
              child: Container(
                height: 40,
                width: 40,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: Colors.blueGrey,

                ),

                child:   IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: ()
                  {
                    takeImage(context);
                  },
                )

              )
          ),

          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Personal Information')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(

                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                    ),
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                        child:Text('Add Addres'),

                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: areaController,
                    decoration: InputDecoration(
                      hintText: 'Area/Locality',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: stateController,
                    decoration: InputDecoration(
                      hintText: 'State',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                      hintText: 'Pincode',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(onPressed: (){
                      validate();
                  }                 ,
                    child: Text('Update',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                   color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          )
        ],
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
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSetting(auth)));



      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Profile Updated Successfully!"),
      content: Text("Check your profie"),
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
