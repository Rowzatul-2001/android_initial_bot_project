
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_care/open_screen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/bmi.dart';
import 'package:pet_care/encyclo.dart';
import 'package:pet_care/expense.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/login.dart';
import 'package:pet_care/petprof.dart';
import 'package:pet_care/rem.dart';
import 'package:pet_care/signup.dart';
import 'package:pet_care/user.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter();
    await Hive.openBox("expense_database");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
  } catch (error) {
    // Handle initialization errors
    print("Error during initialization: $error");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenScreen(),
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light
      ),
      routes:{
        '/user' :(context)=>UserProf(),
         '/petprof' :(context)=>PetProf(),
        '/encyclo' :(context)=>Encyclo(),
        '/exense' :(context)=>Expense(),
        '/bmi' :(context)=>Bmi(),
        '/rem' :(context)=>Rem(),
      },
    );
  }
}
