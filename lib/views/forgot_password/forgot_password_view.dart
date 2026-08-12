import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/forgot_password/forgot_password_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/loading_button.dart';
import '../../widgets/common/responsive_center.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final ForgotPasswordController controller = Get.find<
    ForgotPasswordController
  >();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 130),
              const SizedBox(height: 22),

              Text(
                "Forgot Password",
                style: TextStyle(
                  color: AppColors.headingtextcolor,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                "Enter your email to receive reset instructions",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textcolor, fontSize: 15),
              ),
              const SizedBox(height: 32),

              AppTextField(
                controller: controller.emailController,
                hintText: "Email Address",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              const SizedBox(height: 32),

              LoadingButton(
                isLoading: controller.isLoading,
                onPressed: controller.resetPassword,
                label: "Send Reset Link",
                horizontalPadding: 70,
                elevation: 0,
                textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 28),

              GestureDetector(
                onTap: () => Get.back(),
                child: RichText(
                  text: TextSpan(
                    text: "Back to ",
                    style: TextStyle(
                      color: AppColors.white70,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
