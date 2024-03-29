import '../../../../../core/widgets/custom_verified_in_circal_avatar.dart';
import '../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/utils/date_time.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/style.dart';
import '../../../data/model/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNotificationCard extends StatelessWidget {
  final NoticeModel allNotification;
  const CustomNotificationCard({
    super.key,
    required this.allNotification,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(
        () => ProfileScreen(otherUid: allNotification.personUid),
      ),
      title: Row(
        children: [
          Flexible(
            child: Text(
              textDirection: TextDirection.ltr,
              '@${allNotification.username} ${allNotification.textTitle}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: AppStyle.kTextStyle16,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            textDirection: TextDirection.ltr,
            MyDateUtil.convertDateTime(
              historyAsText: allNotification.datePublished,
            ),
          ),
        ],
      ),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kBackgroundColor,
            backgroundImage: CachedNetworkImageProvider(
              allNotification.personalPicture,
            ),
          ),
          CustomVerifiedInCircalAvatar(visible: allNotification.verified),
        ],
      ),
    );
  }
}
