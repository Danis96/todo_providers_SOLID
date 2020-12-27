import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/app/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _auth = FirebaseAuth.instance;
  }

  FirebaseAuth _auth;

  UserModel _userModel = UserModel();
  UserModel get userModel => _userModel;

  String _loginErrorMsg;
  String get loginErrorMsg => _loginErrorMsg;
  String _registerErrorMsg;
  String get registerErrorMsg => _registerErrorMsg;

  Future<void> registerUser({
    @required String email,
    @required String password,
  }) async {
    try {
      _registerErrorMsg = null;
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userModel = UserModel.fromDocument(userCredential);
      print('REGISTER USER:');
      print('TOKEN: ${_userModel.uid}');
      print('USER: ${_userModel.email}');
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _registerErrorMsg = errors[1];
    }
  }

  Future<void> loginUser({
    @required String email,
    @required String password,
  }) async {
    try {
      _loginErrorMsg = null;
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _userModel = UserModel.fromDocument(userCredential);
      print('LOGIN USER:');
      print('TOKEN: ${_userModel.uid}');
      print('USER: ${_userModel.email}');
      notifyListeners();
    } catch (e) {
      print(e);
      final List<String> errors = e.toString().split(']');
      _loginErrorMsg = errors[1];
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      print('User =======> logout');
    } catch (e) {
      print(e);
    }
  }
}
