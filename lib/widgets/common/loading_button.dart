import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';

class LoadingButton extends StatelessWidget {
  final RxBool isLoading;
  final VoidCallback onPressed;
  final String label;
  final double horizontalPadding;
  final double? elevation;
  final TextStyle textStyle;

  const LoadingButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.label,
    this.horizontalPadding = 80,
    this.elevation,
    this.textStyle = const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isLoading.value
          ? CircularProgressIndicator(color: AppColors.secondaryColor)
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: elevation,
              ),
              child: Text(label, style: textStyle),
            ),
    );
  }
}
