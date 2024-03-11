import 'package:flutter/material.dart';
import 'package:pet_care/utill/color_utill.dart';

import 'opening_service.dart';
class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  Open op=Open();
  @override
  void initState(){
    super.initState();
    op.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          hexStringtoColor("#0a000d"),
          hexStringtoColor("#200838"),
          hexStringtoColor("#3e1369"),
    ] ,
    begin: Alignment.topCenter,end: Alignment.bottomCenter )
    ),
          child: Center(

            child: Column(

              children: [
                SizedBox(
                  height: 150,
                ),
                Image.asset(
            "assests/images/open_image.png",
             width: 800,
                ),
                SizedBox(
                  height: 20,
                ),
                Text("🐾 Welcome to PetPals 🐾",
                style:TextStyle(color: Colors.white,fontSize: 30) ,
                )
              ],
            ),
          ),
        )
    );
  }
}
