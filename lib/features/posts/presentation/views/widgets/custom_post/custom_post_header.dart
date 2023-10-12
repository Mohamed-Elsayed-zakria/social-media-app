import '../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'custom_post_more_current_user.dart';
import 'custom_post_more_other_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_post_status_icon.dart';

class CustomPostHeader extends StatelessWidget {
  final PostModel postData;

  const CustomPostHeader({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: GestureDetector(
        onTap: () => Get.to(() => ProfileScreen(otherUid: postData.personUid)),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kBackgroundColor,
              backgroundImage:
                  CachedNetworkImageProvider(postData.personalPicture),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Visibility(
                visible: postData.verified,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kSurfaceColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.verified,
                    size: 18,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      title: Row(
        children: [
          Text(
            '@${postData.username}',
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          const SizedBox(width: 5),
          Visibility(
            visible: postData.verified,
            child: const Icon(
              Icons.verified,
              size: 17,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            Constant.convertDateTime(historyAsText: postData.datePublished),
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
          const SizedBox(width: 5),
          CustomPostStatusIcon(postData: postData),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          postData.personUid == ApiService.user.uid
              ? Get.bottomSheet(CustomPostMoreCurrentUser(postData: postData))
              : Get.bottomSheet(CustomPostMoreOtherUser(postData: postData));
        },
        icon: const Icon(IconlyBroken.moreCircle),
      ),
    );
  }
}
