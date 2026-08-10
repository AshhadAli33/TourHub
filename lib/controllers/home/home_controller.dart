import 'package:get/get.dart';
import '../../models/tour_post.dart';

class HomeController extends GetxController {
  final selectedCategory = tourCategories.first.obs;

  List<TourPost> get filteredPosts {
    if (selectedCategory.value == tourCategories.first) return tourPosts;
    return tourPosts
        .where((post) => post.category == selectedCategory.value)
        .toList();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
