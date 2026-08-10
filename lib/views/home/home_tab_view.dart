import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home/home_controller.dart';
import '../../models/tour_post.dart';
import '../../utils/app_colors.dart';
import '../../widgets/home/category_chip.dart';
import '../../widgets/home/featured_tour_card.dart';
import '../../widgets/home/tour_list_tile.dart';

class HomeTabView extends GetView<HomeController> {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    const sectionPadding = EdgeInsets.symmetric(horizontal: 20);

    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed header block — greeting, search bar, category chips stay
          // pinned while only the sections below scroll.
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Padding(
              padding: sectionPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Explorer",
                        style: TextStyle(color: AppColors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Where to next?",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white12,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Search bar — hardcoded/static for now, no live search wiring.
          Padding(
            padding: sectionPadding,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              decoration: BoxDecoration(
                color: AppColors.white12,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: AppColors.white54),
                  const SizedBox(width: 10),
                  Text(
                    "Search destinations",
                    style: TextStyle(color: AppColors.white54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Everything from the category chips down scrolls; only the
          // greeting header and search bar above stay pinned in place.
          Expanded(
            child: SingleChildScrollView(
              // Extra bottom padding keeps content clear of the floating bottom nav bar.
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 34,
                    child: Obx(() {
                      // Read synchronously here (not inside itemBuilder, which
                      // runs lazily during layout) so Obx can track it.
                      final selected = controller.selectedCategory.value;
                      return ListView.separated(
                        key: const PageStorageKey('home_categories_list'),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: tourCategories.length,
                        separatorBuilder: (_, _) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final category = tourCategories[index];
                          return CategoryChip(
                            label: category,
                            isSelected: category == selected,
                            onTap: () => controller.selectCategory(category),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 28),

                  Padding(
                    padding: sectionPadding,
                    child: Text(
                      "Featured Destinations",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 275,
                    child: ListView.separated(
                      key: const PageStorageKey('home_featured_list'),
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: tourPosts.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 14),
                      itemBuilder: (context, index) =>
                          FeaturedTourCard(post: tourPosts[index]),
                    ),
                  ),
                  const SizedBox(height: 28),

                  Padding(
                    padding: sectionPadding,
                    child: Text(
                      "Popular Tours",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: sectionPadding,
                    child: Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.filteredPosts.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            TourListTile(post: controller.filteredPosts[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
