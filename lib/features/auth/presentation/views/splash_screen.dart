import '../../../../core/utils/size_screen.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);

    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Image.asset(
          Assets.logo,
          height: size.width * .35,
          width: size.width * .4,
        ),
      ),
    );
  }
}
