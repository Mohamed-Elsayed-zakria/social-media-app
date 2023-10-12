import 'package:flutter/material.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';

class VideoReelsCustomUsername extends StatelessWidget {
  const VideoReelsCustomUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: true,
          child: const Icon(
            Icons.verified,
            color: AppColors.kPrimaryColor,
            size: 17,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          "@mohamed",
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
            color: AppColors.kSurfaceColor,
          ),
        ),
      ],
    );
  }
}
