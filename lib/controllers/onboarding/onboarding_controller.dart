import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var pageIndex = 0.obs;

  void nextPage() {
    if (pageIndex.value < 2) {
      pageIndex.value++;
    }
  }

  void onPageChanged(int index) {
    pageIndex.value = index;
  }
}
