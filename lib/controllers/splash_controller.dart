import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), checkLogin);
  }

  void checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offAllNamed('/home'); // user logged in
    } else {
      Get.offAllNamed('/login'); // no login
    }
  }
}
