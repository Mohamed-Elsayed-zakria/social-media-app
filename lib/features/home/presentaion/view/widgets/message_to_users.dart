import '../../../../../core/model/app_controller.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class MessageToUsers extends StatelessWidget {
  const MessageToUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Visibility(
        visible: AppController.messageToUsers.isNotEmpty,
        child: Card(
          color: AppColors.kSurfaceColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppController.messageToUsers,
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
