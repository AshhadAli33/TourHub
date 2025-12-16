import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  static Future<User?> signup({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<bool> isLoggedIn() async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        await user.reload();
        user = _auth.currentUser;
      } catch (_) {
        return false;
      }
    }

    return user != null;
  }

  static Future<void> logout() async {
    await _auth.signOut();
  }
}
