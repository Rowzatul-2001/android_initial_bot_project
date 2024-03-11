// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/login_controll.dart';
import 'package:pet_care/signup.dart';
import 'package:pet_care/utill/color_utill.dart';
import 'package:provider/provider.dart';

import 'forgot_password.dart';
import 'home.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  bool isVisible=true;
  final formKey=GlobalKey<FormState>();
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                        "assests/images/pet1.png",
                    width: 270,
                    ),
                 const SizedBox(height: 1),
                 //email
                 Container(
                   margin: const EdgeInsets.all(8),
                   padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: Colors.deepPurple[100],
                   ),
                   child: TextFormField(
                     controller: emailController,
                     validator: (value){
                       if(value!.isEmpty)
                         {
                           return 'email is required';
                         }
                         return null;
                     },
                     decoration: const InputDecoration(
                       icon: Icon(Icons.email_outlined),
                       border: InputBorder.none,
                       hintText:"Email"
                     ),
                   ),
                 ),

                    //password field
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple[200],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'password is required';
                          }
                            return null;
                        },
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText:"Password",
                            suffixIcon:IconButton(onPressed:() {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            } , icon:Icon(isVisible?
                            Icons.visibility_off : Icons.visibility) ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //login button
                    ChangeNotifierProvider(
                        create: (_)=>LoginController(),
                      child: Consumer<LoginController>(
                        builder: (context,provider,child) {
                          return Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple[400]
                            ),
                            child: TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  provider.setloading(true);
                                  bool loginSuccess = await provider.login(emailController.text, passwordController.text);
                                  if (loginSuccess) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                  } else {
                                    print('error occurs');
                                  }
                                  provider.setloading(false);
                                }
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white),
                              ),
                            )


                          );
                        },
                      ),
                    ),
                    //signup button
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                      },
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: Color(0xFF8c8e98),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500)),
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have any account?",
                       style: TextStyle(color: Colors.white,fontSize: 16) ,
                       ),
                        TextButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                        }, child: Text("SIGN UP",
                          style: TextStyle(color: Colors.deepPurple[100],fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
