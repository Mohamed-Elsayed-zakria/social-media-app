import '../../../../../core/api/api_service.dart';
import '../../../../stories/presentation/view/widgets/dialog_uploade_story.dart';
import '../../../../chats/presentation/views/chat_screen_all_users.dart';
import '../../../../profile/presentation/views/profile_screen.dart';
import '../../../../search/presentation/view/search_screen.dart';
import '../../../../posts/presentation/views/post_screen.dart';
import '../../../../../core/constant/colors.dart';
import 'buttom_sheet_upload_post_or_story.dart';
import 'home_screen_custom_circle_avatar.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenCustomAppbar extends StatelessWidget {
  const HomeScreenCustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.kSurfaceColor,
      title: InkWell(
        onTap: () => Get.to(
          () => ProfileScreen(otherUid: ApiService.user.uid),
        ),
        child: const HomeScreenCustomCircleAvatar(),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(() => const ChatScreenAllUsers()),
          icon: const Icon(
            IconBroken.Chat,
            color: AppColors.kOnSurfaceColor,
          ),
        ),
        IconButton(
          onPressed: () => Get.to(() => const SearchScreen()),
          icon: const Icon(
            IconBroken.Search,
            color: AppColors.kOnSurfaceColor,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Get.bottomSheet(
            ButtomSheetUploadPostOrStory(
              onTapUploadePost: () {
                Get.off(() => const PostScreen());
              },
              onTapUploadeStory: () {
                Get.back();
                Get.defaultDialog(
                  title: 'uploude story'.tr,
                  titlePadding: const EdgeInsets.only(top: 26, bottom: 7),
                  content: const DialogUploadeStory(),
                );
              },
            ),
          );
        },
        icon: const Icon(
          IconBroken.Arrow___Up_Square,
          color: AppColors.kOnSurfaceColor,
        ),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
    );
  }
}
