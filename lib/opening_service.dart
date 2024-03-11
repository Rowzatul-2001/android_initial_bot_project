import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/login.dart';
import 'package:pet_care/session_manager.dart';

class Open{
  void isLogin(BuildContext context){
    FirebaseAuth auth=FirebaseAuth.instance;
    final user =auth.currentUser;

    if(user != null) {
      SessionController().userId=user.uid.toString();
      Timer(Duration(seconds: 1), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Home())));
    }

    else Timer(Duration(seconds: 1), ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Login())));
  }
}