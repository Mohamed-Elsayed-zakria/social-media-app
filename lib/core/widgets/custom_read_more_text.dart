import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../constant/colors.dart';
import '../constant/style.dart';

class CustomReadMoreText extends StatelessWidget {
  final String text;
  final int trimLines;
  final TextStyle style;
  const CustomReadMoreText({
    super.key,
    required this.text,
    required this.trimLines,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: style,
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'showMore',
      trimExpandedText: 'showLess',
      lessStyle: const TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: AppStyle.kTextStyle16,
        fontWeight: FontWeight.bold,
      ),
      moreStyle: const TextStyle(
        color: AppColors.kPrimaryColor,
        fontSize: AppStyle.kTextStyle16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
