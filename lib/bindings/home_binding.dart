import 'package:get/get.dart';
import '../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../controllers/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
