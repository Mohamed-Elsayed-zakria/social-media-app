import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackgroundColor,
        body: HomeScreenBody(),
      ),
    );
  }
}
