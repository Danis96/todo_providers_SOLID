import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/app/repository/authentification_repository.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _authRepository = AuthRepository();
  }

  AuthRepository _authRepository;

  Future<void> registerUser({
    @required String email,
    @required String password,
    @required GlobalKey<FormState> key,
  }) async {
    try {
      final UserCredential userCredential =
          await _authRepository.signUp(email, password, key);
      print('REGISTER USER:');
      print('TOKEN: ${userCredential.user.uid}');
      print('USER: ${userCredential.user.email}');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUser({
    @required String email,
    @required String password,
    @required GlobalKey<FormState> key,
  }) async {
    try {
      final UserCredential userCredential =
          await _authRepository.signIn(email, password, key);
      print('LOGIN USER:');
      print('TOKEN: ${userCredential.user.uid}');
      print('USER: ${userCredential.user.email}');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
