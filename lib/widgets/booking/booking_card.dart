import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../../utils/app_colors.dart';
import '../common/network_post_image.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  bool get _isUpcoming => booking.travelDate.isAfter(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final post = booking.post;
    final date = booking.travelDate;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                NetworkPostImage(imageUrl: post.imageUrl),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.05),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: _Pill(
                    icon: Icons.star_rounded,
                    iconColor: AppColors.secondaryColor,
                    label: post.rating.toStringAsFixed(1),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _Pill(
                    icon: _isUpcoming
                        ? Icons.check_circle_rounded
                        : Icons.task_alt_rounded,
                    iconColor: _isUpcoming
                        ? AppColors.success
                        : AppColors.overlayGrey,
                    label: _isUpcoming ? "Confirmed" : "Completed",
                  ),
                ),
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            size: 13,
                            color: AppColors.white70,
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              post.location,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.white70,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _detail(
                      Icons.calendar_month_rounded,
                      "${date.day}/${date.month}/${date.year}",
                    ),
                    _detail(
                      Icons.people_alt_rounded,
                      "${booking.guests} guest${booking.guests > 1 ? 's' : ''}",
                    ),
                    Text(
                      "\$${booking.total.toStringAsFixed(0)}",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const _DashedDivider(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _isUpcoming
                            ? Icons.confirmation_number_outlined
                            : Icons.star_border_rounded,
                        size: 14,
                        color: AppColors.secondaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _isUpcoming ? "View e-ticket" : "Rate this trip",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.white54),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: AppColors.white70, fontSize: 12)),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  const _Pill({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: iconColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashGap = 4.0;
        final dashCount = (constraints.maxWidth / (dashWidth + dashGap))
            .floor();
        return SizedBox(
          height: 1,
          child: Row(
            children: List.generate(
              dashCount,
              (_) => Padding(
                padding: const EdgeInsets.only(right: dashGap),
                child: Container(
                  width: dashWidth,
                  height: 1,
                  color: AppColors.white.withValues(alpha: 0.15),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
