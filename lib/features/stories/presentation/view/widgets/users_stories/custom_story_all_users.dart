import '../../../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import '../custom_story_shimmer.dart';
import 'custom_story_item_all_users.dart';

class CustomStoryAllUsers extends StatelessWidget {
  final Future<List<List<StoriesModel>>> future;

  const CustomStoryAllUsers({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => const CustomStoryShimmer(),
          );
        } else {
          List<List<StoriesModel>> storyDataList = snapshot.data!;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: storyDataList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<StoriesModel> userStories = storyDataList[index];
              StoriesModel firstStory = userStories[0];
              return CustomStoryItemAllUsers(
                storyDatabasic: storyDataList,
                firstStory: firstStory,
                initialPage: index,
              );
            },
          );
        }
      },
    );
  }
}
