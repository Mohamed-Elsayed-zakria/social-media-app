import '../../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../data/models/block_users_model.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockedUsersCustomPerson extends StatelessWidget {
  final BlockUserModel blockUserModel;
  const BlockedUsersCustomPerson({
    super.key,
    required this.blockUserModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => Get.to(
          () => ProfileScreen(
            otherUid: blockUserModel.personalUid,
          ),
        ),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.kSurfaceColor,
          backgroundImage: CachedNetworkImageProvider(
            blockUserModel.personalPicture,
          ),
        ),
        title: Text('@${blockUserModel.username}'),
      ),
    );
  }
}
