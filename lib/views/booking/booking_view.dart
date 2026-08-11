import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/booking_controller.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/booking/booking_card.dart';
import '../../widgets/common/gradient_scaffold.dart';

class BookingView extends StatelessWidget {
  BookingView({super.key});

  final BookingController controller = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Bookings",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Obx(
            () => Text(
              controller.bookings.isEmpty
                  ? "Your trips will live here"
                  : "${controller.bookings.length} trip${controller.bookings.length == 1 ? '' : 's'} booked",
              style: TextStyle(color: AppColors.white54, fontSize: 13),
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Obx(() {
              final bookings = controller.bookings;
              if (bookings.isEmpty) {
                return _EmptyState();
              }
              return ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: bookings.length + 1,
                separatorBuilder: (_, _) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _StatsRow(controller: controller);
                  }
                  return BookingCard(booking: bookings[index - 1]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final BookingController controller;

  const _StatsRow({required this.controller});

  @override
  Widget build(BuildContext context) {
    final bookings = controller.bookings;
    final upcoming = bookings
        .where((b) => b.travelDate.isAfter(DateTime.now()))
        .length;
    final guests = bookings.fold<int>(0, (sum, b) => sum + b.guests);
    final spent = bookings.fold<double>(0, (sum, b) => sum + b.total);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.flight_takeoff_rounded,
              label: "Upcoming",
              value: "$upcoming",
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatCard(
              icon: Icons.people_alt_rounded,
              label: "Guests",
              value: "$guests",
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _StatCard(
              icon: Icons.savings_rounded,
              label: "Spent",
              value: "\$${spent.toStringAsFixed(0)}",
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white12,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.secondaryColor),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: AppColors.white54, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 96,
            width: 96,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.secondaryColor.withValues(alpha: 0.25),
                  AppColors.secondaryColor.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: Icon(
              Icons.airplane_ticket_outlined,
              size: 42,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "No bookings yet",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Tours you book will show up here,\nready for your next adventure.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.white54,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () =>
                Get.find<BottomNavController>().changeIndex(0),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 13,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.explore_rounded, size: 18),
            label: const Text(
              "Explore Tours",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
