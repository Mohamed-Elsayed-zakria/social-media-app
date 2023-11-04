import '../../../../stories/presentation/view/widgets/users_stories/custom_story_all_users.dart';
import '../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../controller/home_sceen_controller.dart';
import 'home_screen_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'message_to_users.dart';
import 'package:get/get.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => RefreshIndicator(
        onRefresh: () async => controller.update(),
        child: CustomScrollView(
          slivers: [
            const HomeScreenCustomAppbar(),
            CustomStoryAllUsers(future: getAllUsersStories()),
            const MessageToUsers(),
            CustomPost(future: getAllPosts()),
          ],
        ),
      ),
    );
  }
}
