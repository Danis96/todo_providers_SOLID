import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: missing_return
  Future<UserCredential> signIn(
      String email, String pass, GlobalKey<FormState> key) async {
    final FormState _formState = key.currentState;
    if (_formState.validate()) {
      try {
        final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );
        return result;
      } catch (e) {
        print(e);
      }
    }
  }

  // ignore: missing_return
  Future<UserCredential> signUp(
      String email, String pass, GlobalKey<FormState> key) async {
    final FormState _formState = key.currentState;
    if (_formState.validate()) {
      try {
        final UserCredential result =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: pass,
        );
        return result;
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
