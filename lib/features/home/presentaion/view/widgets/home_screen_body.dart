import '../../../../stories/presentation/view/widgets/current_story/custom_story_current_user.dart';
import '../../../../stories/presentation/view/widgets/users_stories/custom_story_all_users.dart';
import '../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../../../stories/presentation/view/widgets/custom_story_cover.dart';
import '../../controller/home_sceen_controller.dart';
import 'home_screen_custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => setState(() {}),
      child: CustomScrollView(
        slivers: [
          const HomeScreenCustomAppbar(),
          SliverToBoxAdapter(
            child: CustomStoryCover(
              child: Row(
                children: [
                  CustomStoryCurrentUser(future: getCurrentUserStory()),
                  CustomStoryAllUsers(future: getAllUsersStories()),
                ],
              ),
            ),
          ),
          CustomPost(future: getAllPosts()),
        ],
      ),
    );
  }
}
