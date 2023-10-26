import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/model/current_user_data.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreenHeader extends StatelessWidget {
  const PostScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kSurfaceColor,
        backgroundImage: CachedNetworkImageProvider(
          CurrentUserData.personalPicture,
        ),
      ),
      title: Text('@${CurrentUserData.username}'),
      subtitle: Text("uploade post".tr),
    );
  }
}
