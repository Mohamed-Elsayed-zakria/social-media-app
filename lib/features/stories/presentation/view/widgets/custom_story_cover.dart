import 'package:flutter/material.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/constant.dart';

class CustomStoryCover extends StatelessWidget {
  final Widget child;
  const CustomStoryCover({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
      margin: const EdgeInsets.only(bottom: 3),
      width: double.infinity,
      height: size.height * .16,
      decoration: BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kOnSurfaceColor.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
