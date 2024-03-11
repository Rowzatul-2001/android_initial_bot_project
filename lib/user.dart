import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/login.dart';
import 'package:pet_care/profile_controller.dart';
import 'package:pet_care/session_manager.dart';
import 'package:pet_care/utill/color_utill.dart';
import 'package:provider/provider.dart';

class UserProf extends StatefulWidget {
  const UserProf({super.key});

  @override
  State<UserProf> createState() => _UserState();
}

class _UserState extends State<UserProf> {
 final ref=FirebaseDatabase.instance.ref('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100000,
        backgroundColor: Colors.deepPurple[100],
        title: Text('User Profile',
          style: TextStyle(
              color: Colors.deepPurple[400],
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ChangeNotifierProvider(
          create: (_)=>ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context,provider,child){
               return SafeArea(
  child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: StreamBuilder(
        stream:ref.child(SessionController().userId.toString()).onValue ,
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData){
            Map<dynamic,dynamic>map=snapshot.data.snapshot.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.deepPurple,
                                //width:5
                              )
                          ),
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(50),

                            child:provider.image==null?
                            map['profile'].toString()==""? Icon(Icons.person,size: 60,):
                            Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(map['profile'].toString()),
                                loadingBuilder: (context,child,loadingProgress){
                                  if(loadingProgress==null) return child;
                                  return Center(child: CircularProgressIndicator());
                                },
                                errorBuilder:(context,object,stack){
                                  return  Container(
                                    child: Icon(Icons.error_outline),
                                  );
                                }
                            ):
                                Image.file(
                                  File(provider.image!.path).absolute
                                )
                            ,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                         provider.pickImage(context);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.deepPurple[400],
                        child: Icon(Icons.add,size:20 ,color: Colors.white,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 50,),
                ReusableRow(title: 'Username',value:map['userName'],icd: Icons.person_outline,),
                ReusableRow(title: 'Phone',value:map['phone']==""? 'xxxx-xxxx-xxx': map['phone'],icd: Icons.phone_outlined),
                ReusableRow(title: 'Email',value:map['email'],icd: Icons.email_outlined,),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.deepPurple[400]
                      ),
                      child: TextButton(onPressed:(){
                        FirebaseAuth auth = FirebaseAuth.instance;
                        auth.signOut().then((value){
                          SessionController().userId= ' ';
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        });
                      }, child: Text(
                        "LOGOUT",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      ),
                    ),
                  ],
                ),

              ],
            );
          }else{
            return Center(child: Text("Something went wrong",style: TextStyle(color: Colors.deepPurple,fontSize: 20),));
          }
        },
      )
  ),
);
          },
        ),
      )
    );
  }
}


class ReusableRow extends StatelessWidget {
  final String title,value;
  final IconData icd;
  const ReusableRow({Key? key,required this.title,required this.value,required this.icd}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title,style:TextStyle(color: Colors.deepPurple[300],fontSize: 14),),
          leading: Icon(icd,color: Colors.deepPurple,),
          trailing: Text(value,style:TextStyle(color: Colors.deepPurple[400],fontSize: 13),),
        ),
        Divider(color: Colors.black.withOpacity(0.2),)
      ],
    );
  }
}

