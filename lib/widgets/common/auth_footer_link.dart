import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class AuthFooterLink extends StatelessWidget {
  final String promptText;
  final String actionText;
  final VoidCallback onTap;

  const AuthFooterLink({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: promptText,
        style: const TextStyle(color: AppColors.white70, fontSize: 15),
        children: [
          TextSpan(
            text: actionText,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
