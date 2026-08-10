import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/signup/signup_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common/app_text_field.dart';
import '../../widgets/common/auth_footer_link.dart';
import '../../widgets/common/gradient_scaffold.dart';
import '../../widgets/common/loading_button.dart';
import '../../widgets/common/responsive_center.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupController controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ResponsiveCenter(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', width: 180),
              const SizedBox(height: 32),

              AppTextField(
                controller: controller.nameController,
                hintText: 'Full Name',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
              const SizedBox(height: 16),

              AppTextField(
                controller: controller.emailController,
                hintText: 'Email',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
              ),
              const SizedBox(height: 16),

              Obx(
                () => AppTextField(
                  controller: controller.passwordController,
                  hintText: 'Password',
                  obscureText: !controller.isPasswordVisible.value,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  suffixIcon: IconButton(
                    onPressed: controller.togglePassword,
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.white60,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed('/forgot'),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              LoadingButton(
                isLoading: controller.isLoading,
                onPressed: controller.signup,
                label: 'Sign Up',
                elevation: 2,
              ),

              const SizedBox(height: 22),

              AuthFooterLink(
                promptText: "Already have an account? ",
                actionText: "Login",
                onTap: () => Get.back(),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
