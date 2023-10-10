import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.kPrimaryColor),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle18,
             color: AppColors.kSurfaceColor,
          ),
        ),
      ),
    );
  }
}
