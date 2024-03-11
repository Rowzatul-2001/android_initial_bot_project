

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/login.dart';
import 'package:pet_care/sign_controll.dart';
import 'package:pet_care/utill/color_utill.dart';
import 'package:pet_care/utill/function.dart';
import 'package:provider/provider.dart';

import 'login.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool isVisible = true;
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
          child: ChangeNotifierProvider(
            create: (_)=>SignupControll(),
            child: Consumer<SignupControll>(
              builder: (context,provider,child){
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          Image.asset("assests/images/pet2.png",
                              height: 300
                          ),
                          //username
                          Container(
                            margin: EdgeInsets.all(8),
                            padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.deepPurple[100],
                            ),
                            child: TextFormField(
                              controller: usernameController,

                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'username is required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText:"UserName"
                              ),
                            ),
                          ),
                          //password
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
                                hintText:"Email",
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //signup button
                          Column(
                            children: [
                              Container(
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
                                      await provider.signup(usernameController.text, passwordController.text, emailController.text);

                                      if (!provider.loading) {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "SIGN UP",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )

                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                              TextButton(onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              }, child: Text("LOGIN",
                                style: TextStyle(color: Colors.deepPurple[200],fontWeight: FontWeight.bold),
                              ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ),
      ),
    );
  }
}
