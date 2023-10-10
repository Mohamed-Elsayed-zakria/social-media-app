import '../../../../data/model/stories_model.dart';
import 'custom_story_cerrent_not_fount.dart';
import 'custom_story_item_current_users.dart';
import 'package:flutter/material.dart';
import '../custom_story_shimmer.dart';

class CustomStoryCurrentUser extends StatelessWidget {
  final Future<List<StoriesModel>> future;
  const CustomStoryCurrentUser({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomStoryShimmer();
        } else {
          List<StoriesModel> allStories = snapshot.data!;
          return allStories.isNotEmpty
              ? CustomStoryItemCurrentUsers(stories: allStories)
              : const CustomStoryCurrentNotFount();
        }
      },
    );
  }
}
