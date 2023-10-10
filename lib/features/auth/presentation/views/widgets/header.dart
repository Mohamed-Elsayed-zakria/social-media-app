import '../../../../../core/constant/constant.dart';
import '../../../../../core/constant/assets.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: size.height * .25,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: AppColors.kPrimaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            width: size.width * .45,
            height: size.width * .38,
          ),
          Text(
            "Appname".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle20,
              color: AppColors.kSurfaceColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
