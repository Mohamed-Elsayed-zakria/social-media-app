import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/model/current_user_data.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomStoryCurrentPersonalPicture extends StatelessWidget {
  const CustomStoryCurrentPersonalPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Stack(
      children: [
        CircleAvatar(
          radius: size.width * .110,
          backgroundColor: AppColors.kSurfaceColor,
          child: CircleAvatar(
            radius: size.width * .102,
            backgroundColor: AppColors.kBackgroundColor,
            backgroundImage: CachedNetworkImageProvider(
              CurrentUserData.personalPicture,
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.kSurfaceColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.add,
                size: size.width * .058,
                color: AppColors.kSurfaceColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
