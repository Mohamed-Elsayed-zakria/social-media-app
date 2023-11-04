import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/utils/size_screen.dart';
import '../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';

class HomeScreenCustomCircleAvatar extends StatelessWidget {
  const HomeScreenCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return CircleAvatar(
      radius: size.width * .064,
      backgroundColor: AppColors.kBackgroundColor,
      child: CircleAvatar(
        radius: size.width * .060,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(
          CurrentUserData.personalPicture,
        ),
      ),
    );
  }
}
