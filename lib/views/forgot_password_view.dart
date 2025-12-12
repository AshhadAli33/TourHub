import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourhub/utils/app_colors.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(gradient: AppColors.onboardingGradient),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LOGO
                  Image.asset('assets/images/logo.png', width: 130),

                  SizedBox(height: 22),

                  // TITLE
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: AppColors.headingtextcolor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: 10),

                  // SUBTEXT
                  Text(
                    "Enter your email to receive reset instructions",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textcolor, fontSize: 15),
                  ),

                  SizedBox(height: 32),

                  // EMAIL FIELD
                  TextField(
                    controller: controller.emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.12),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 32),

                  // SEND BUTTON
                  Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                          )
                        : ElevatedButton(
                            onPressed: controller.resetPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 70,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Send Reset Link",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ),

                  SizedBox(height: 20),

                  // Bottom "Back to Login" text
                  Positioned(
                    bottom: 32,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.back(); // Go back to Login
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Back to ",
                            style: TextStyle(
                              color: Colors.white70,
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
                    ),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
