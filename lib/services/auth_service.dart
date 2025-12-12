// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login with Email & Password
  Future<User?> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw e;
    }
  }

  // Optional: Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
