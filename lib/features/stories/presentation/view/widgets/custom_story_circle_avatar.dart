import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/utils/size_screen.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomStoryCircleAvatar extends StatelessWidget {
  final String personalPicture;
  const CustomStoryCircleAvatar({
    super.key,
    required this.personalPicture,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);

    return CircleAvatar(
      backgroundColor: AppColors.kPrimaryColor,
      radius: size.width * .110,
      child: CircleAvatar(
        radius: size.width * .102,
        backgroundColor: AppColors.kSurfaceColor,
        child: CircleAvatar(
          radius: size.width * .094,
          backgroundColor: AppColors.kBackgroundColor,
          backgroundImage: CachedNetworkImageProvider(personalPicture),
        ),
      ),
    );
  }
}
