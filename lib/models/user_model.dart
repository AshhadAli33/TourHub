import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String? name;
  final String? email;
  final String? photoUrl;

  const UserModel({required this.uid, this.name, this.email, this.photoUrl});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      name: user.displayName,
      email: user.email,
      photoUrl: user.photoURL,
    );
  }
}
