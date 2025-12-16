import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
        child: const Center(
          child: Text(
            "Bookings Screen",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
