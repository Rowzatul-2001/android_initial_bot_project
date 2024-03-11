import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/bmi.dart';
import 'package:pet_care/encyclo.dart';
import 'package:pet_care/expense.dart';
import 'package:pet_care/login.dart';
import 'package:pet_care/petprof.dart';
import 'package:pet_care/rem.dart';
import 'package:pet_care/session_manager.dart';
import 'package:pet_care/signup.dart';
import 'package:pet_care/user.dart';
import 'package:pet_care/utill/color_utill.dart';
import 'dart:async';

// Create a StreamController to manage the stream

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //const Home({super.key});


  @override
  Widget build(BuildContext context) {
     var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        elevation: 100000,
        backgroundColor: Colors.deepPurple[100],
        title: Text('Sperad love for pet',
        style: TextStyle(
          color: Colors.deepPurple[400],
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        ),

      ),

      body: Container(
        height: h,
        width: w,
        color: Colors.deepPurple[400],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset("assests/images/pet5.png"),
              Text("WELCOME",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Container(
                decoration: BoxDecoration(),
                height: h*0.02,
                width: w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                height: h*0.90,
                width: w,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: GridView(children: [
                  //user profile
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProf()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/user.png",
                            width: 120,
                          ),
                          const SizedBox(height: 10),
                          Text("User",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                  //petprofile
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PetProf()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/petprof.png",
                                width: 200,
                          ),
                          Text("Pet Profile",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                  //encyclo
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Encyclo()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/encyclo.png",
                            width: 150,
                          ),
                          Text("Encyclopedia",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                  //expense
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/expense.png",
                            width: 150,
                          ),
                          Text("Expense Tracker",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                  //bmi
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bmi()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/bmi.png",
                            width: 150,
                          ),
                          Text("BMI",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                  //reminder
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Rem()));
                    },
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.deepPurple[100]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assests/images/rem.png",
                            width: 400,
                          ),
                          Text("Reminder",style: TextStyle(color: Colors.deepPurple,fontSize: 20),)
                        ],),
                    ),
                  ),
                ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
