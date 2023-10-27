import '../../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import '../../../../../profile/presentation/views/profile_screen.dart';
import 'custom_post_more_on_header/custom_post_more_current_user.dart';
import 'custom_post_more_on_header/custom_post_more_other_user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/utils/date_time.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'custom_post_status_icon.dart';
import 'package:get/get.dart';

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
            CustomVerifiedInCircalAvatar(visible: postData.verified),
          ],
        ),
      ),
      title: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
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
            textDirection: TextDirection.ltr,
            MyDateUtil.convertDateTime(historyAsText: postData.datePublished),
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
