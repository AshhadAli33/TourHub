import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widgets/common/gradient_scaffold.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      body: Center(
        child: Text(
          "Chats Screen",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
      ),
    );
  }
}
