import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/model/current_user_data.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryCustomHeader extends StatelessWidget {
  const UploadeStoryCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kSurfaceColor,
        backgroundImage:
            CachedNetworkImageProvider(CurrentUserData.personalPicture),
      ),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            '@${CurrentUserData.username}',
          ),
        ],
      ),
      subtitle: Text('Add new story'.tr),
    );
  }
}
