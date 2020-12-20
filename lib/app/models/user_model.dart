import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.uid,
  });

  factory UserModel.fromDocument(UserCredential userCredential) {
    return UserModel(
      email: userCredential.user.email ?? '',
      name: userCredential.user.displayName ?? '',
      uid: userCredential.user.uid ?? '',
    );
  }

  String email;
  String name;
  String uid;
}
