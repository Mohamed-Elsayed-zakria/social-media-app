import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/constant/colors.dart';

class VideoReelsCustomShare extends StatelessWidget {
  const VideoReelsCustomShare({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        IconlyBroken.send,
        size: 35,
        color: AppColors.kSurfaceColor,
      ),
    );
  }
}
