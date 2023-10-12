import '../../../../../core/utils/date_time.dart';
import '../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../data/model/notice_model.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/style.dart';
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
          Text(
            '@${allNotification.username} ${allNotification.textTitle}',
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
        ],
      ),
      subtitle: Text(
        MyDateUtil.convertDateTime(
          historyAsText: allNotification.datePublished,
        ),
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
          Positioned(
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: allNotification.verified,
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
    );
  }
}
