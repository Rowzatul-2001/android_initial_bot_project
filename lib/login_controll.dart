import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/session_manager.dart';
import 'package:pet_care/utill/function.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    setloading(true);
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SessionController().userId = userCredential.user!.uid.toString();
      setloading(false);
      return true;
    } catch (e) {
      setloading(false);
      Func.toasstMassage("Login failed: $e");
      return false;
    }
  }

}
