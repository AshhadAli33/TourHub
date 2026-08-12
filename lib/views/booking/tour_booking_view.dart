import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/booking/booking_controller.dart';
import '../../controllers/bottom_navigation_bar/bottom_nav_controller.dart';
import '../../models/booking.dart';
import '../../models/tour_post.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_snackbar.dart';
import '../../widgets/common/network_post_image.dart';

class TourBookingView extends StatefulWidget {
  final TourPost post;

  const TourBookingView({super.key, required this.post});

  @override
  State<TourBookingView> createState() => _TourBookingViewState();
}

class _TourBookingViewState extends State<TourBookingView> {
  late DateTime _travelDate = DateTime.now().add(const Duration(days: 7));
  int _guests = 1;

  double get _total => widget.post.price * _guests;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _travelDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.secondaryColor,
              onPrimary: AppColors.primaryColor,
              surface: AppColors.primaryColor,
              onSurface: AppColors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _travelDate = picked);
    }
  }

  void _changeGuests(int delta) {
    setState(() => _guests = (_guests + delta).clamp(1, 10));
  }

  void _confirmBooking() {
    Get.find<BookingController>().addBooking(
      Booking(
        post: widget.post,
        travelDate: _travelDate,
        guests: _guests,
        bookedAt: DateTime.now(),
      ),
    );

    // Return to Home and switch to the Booking tab so the confirmed tour
    // is immediately visible.
    Get.until((route) => route.settings.name == AppRoutes.home);
    Get.find<BottomNavController>().changeIndex(1);

    // Deferred a frame so the snackbar's overlay ticker isn't attached
    // while the popped routes' overlay entries are still being disposed.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppSnackbar.success(
        "Booking Confirmed",
        "${widget.post.title} booked for $_guests guest${_guests > 1 ? 's' : ''} on "
            "${_travelDate.day}/${_travelDate.month}/${_travelDate.year}.",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final topInset = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, topInset + 12, 16, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white12,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    "Book Your Tour",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tour summary card.
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      child: Row(
                        children: [
                          NetworkPostImage(
                            imageUrl: post.imageUrl,
                            height: 64,
                            width: 64,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      size: 13,
                                      color: AppColors.white54,
                                    ),
                                    const SizedBox(width: 3),
                                    Expanded(
                                      child: Text(
                                        post.location,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColors.white54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),

                    Text(
                      "Travel Date",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white12,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: AppColors.secondaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "${_travelDate.day}/${_travelDate.month}/${_travelDate.year}",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.white54,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      "Guests",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white12,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_alt_rounded,
                            color: AppColors.secondaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "$_guests guest${_guests > 1 ? 's' : ''}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          _stepperButton(
                            icon: Icons.remove_rounded,
                            onTap: () => _changeGuests(-1),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "$_guests",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          _stepperButton(
                            icon: Icons.add_rounded,
                            onTap: () => _changeGuests(1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),

                    Text(
                      "Price Summary",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _summaryRow(
                      "Price per guest",
                      "\$${post.price.toStringAsFixed(0)}",
                    ),
                    const SizedBox(height: 8),
                    _summaryRow("Guests", "x$_guests"),
                    const SizedBox(height: 10),
                    Divider(color: AppColors.white.withValues(alpha: 0.15)),
                    const SizedBox(height: 10),
                    _summaryRow(
                      "Total",
                      "\$${_total.toStringAsFixed(0)}",
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                16 + MediaQuery.paddingOf(context).bottom,
              ),
              decoration: BoxDecoration(
                color: AppColors.white12,
                border: Border(
                  top: BorderSide(color: AppColors.white.withValues(alpha: 0.1)),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _confirmBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    foregroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Confirm Booking",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stepperButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.secondaryColor, size: 16),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isTotal ? AppColors.white : AppColors.white70,
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isTotal ? AppColors.secondaryColor : AppColors.white,
            fontSize: isTotal ? 18 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
