import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Func{
  static void fieldFoc(BuildContext context,FocusNode currFoc,FocusNode nextFoc){
    currFoc.unfocus();
    FocusScope.of(context).requestFocus(nextFoc);
  }
  static toasstMassage(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.deepPurple[400],
      textColor: Colors.white,
      fontSize: 18
    );
  }
}