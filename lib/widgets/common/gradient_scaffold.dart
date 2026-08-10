import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;

  const GradientScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.onboardingGradient),
        padding: padding,
        child: SafeArea(child: body),
      ),
    );
  }
}
