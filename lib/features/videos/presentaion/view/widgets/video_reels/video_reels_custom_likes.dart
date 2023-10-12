import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../../core/constant/colors.dart';

class VideoReelsCustomLikes extends StatelessWidget {
  const VideoReelsCustomLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconlyBroken.heart,
            size: 43,
            color: AppColors.kSurfaceColor,
          ),
        ),
        Text(
          '1000',
          style: TextStyle(
            color: AppColors.kSurfaceColor,
          ),
        ),
      ],
    );
  }
}
