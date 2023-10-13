import '../../../../videos/presentaion/controller/uploade_video_reels_controller.dart';
import '../../../../stories/presentation/view/widgets/dialog_uploade_story.dart';
import '../../../../chats/presentation/views/chat_screen_all_users.dart';
import '../../../../profile/presentation/views/profile_screen.dart';
import '../../../../search/presentation/view/search_screen.dart';
import '../../../../posts/presentation/views/post_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/constant/colors.dart';
import 'custom_buttom_sheet_uploade_element.dart';
import '../../../../../core/api/api_service.dart';
import 'home_screen_custom_circle_avatar.dart';
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
            IconlyBroken.chat,
            color: AppColors.kOnSurfaceColor,
          ),
        ),
        IconButton(
          onPressed: () => Get.to(() => const SearchScreen()),
          icon: const Icon(
            IconlyBroken.search,
            color: AppColors.kOnSurfaceColor,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Get.bottomSheet(
            CustomButtomSheetUploadeElement(
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
              onTapUploadeReels: () {
                Get.back();
                addVideoReelsOpenGalary();
              },
            ),
          );
        },
        icon: const Icon(
          IconlyBroken.arrowUpSquare,
          color: AppColors.kOnSurfaceColor,
        ),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
    );
  }
}
