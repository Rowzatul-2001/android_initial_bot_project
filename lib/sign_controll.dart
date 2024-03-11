import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/session_manager.dart';
import 'package:pet_care/utill/function.dart';
import 'package:provider/provider.dart';

class SignupControll with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signup(String username, String password, String email) async {
    setloading(true);

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      SessionController().userId = userCredential.user!.uid.toString();

      await ref.child(userCredential.user!.uid.toString()).set({
        'uid': userCredential.user!.uid.toString(),
        'email': userCredential.user!.email.toString(),
        'onlineStatus': 'noOne',
        'phone': '',
        'userName': username,
        'profile': '',
      });

      setloading(false);
    } catch (e) {
      setloading(false);
      Func.toasstMassage("Signup failed: $e");
    }
  }
}
