import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/booking_controller.dart';
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
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              final bookings = controller.bookings;
              if (bookings.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.airplane_ticket_outlined,
                        size: 56,
                        color: AppColors.white24,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "No bookings yet",
                        style: TextStyle(
                          color: AppColors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Tours you book will show up here.",
                        style: TextStyle(
                          color: AppColors.white54,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.separated(
                itemCount: bookings.length,
                separatorBuilder: (_, _) => const SizedBox(height: 14),
                itemBuilder: (context, index) => BookingCard(
                  booking: bookings[index],
                  onCancel: () => controller.cancelBooking(bookings[index]),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
