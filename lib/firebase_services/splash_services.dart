import 'dart:async';
import 'package:firebase1/ui/auth/login_Screen.dart';
import 'package:firebase1/ui/firstore/firestore_list_screen.dart';
import 'package:firebase1/ui/posts/post_screen.dart';
import 'package:firebase1/ui/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user != null){
      Timer(Duration(seconds: 1),
              // ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageScreen()))
              // ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreScreen()))
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()))
      );
    }else{
      Timer(Duration(seconds: 1),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
      );
    }


  }
}