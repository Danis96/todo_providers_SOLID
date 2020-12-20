import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/app/models/user_model.dart';
import 'package:todo/app/repository/authentification_repository.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _authRepository = AuthRepository();
  }

  AuthRepository _authRepository;

  UserModel _userModel;

  Future<UserModel> registerUser({
    @required String email,
    @required String password,
    @required GlobalKey<FormState> key,
  }) async {
    try {
      final UserCredential userCredential =
          await _authRepository.signUp(email, password, key);
      _userModel = UserModel.fromDocument(userCredential);
      print('REGISTER USER:');
      print('TOKEN: ${_userModel.uid}');
      print('USER: ${_userModel.email}');
      notifyListeners();
      return _userModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel> loginUser({
    @required String email,
    @required String password,
    @required GlobalKey<FormState> key,
  }) async {
    try {
      final UserCredential userCredential =
          await _authRepository.signIn(email, password, key);
      _userModel = UserModel.fromDocument(userCredential);
      print('LOGIN USER:');
      print('TOKEN: ${_userModel.uid}');
      print('USER: ${_userModel.email}');
      notifyListeners();
      return _userModel;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _authRepository.logout();
      print('User =======> logout');
    } catch (e) {
      print(e);
    }
  }
}
