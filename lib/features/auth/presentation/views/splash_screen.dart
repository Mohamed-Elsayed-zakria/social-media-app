import 'package:flash/core/constant/colors.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/constant/assets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

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
