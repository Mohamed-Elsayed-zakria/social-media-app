import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
import '../current_story/custom_story_item_current_users.dart';
import '../current_story/custom_story_cerrent_not_fount.dart';
import '../../../../data/model/stories_model.dart';
import 'custom_story_item_all_users.dart';
import 'package:flutter/material.dart';
import '../custom_story_shimmer.dart';
import '../custom_story_cover.dart';

class CustomStoryAllUsers extends StatelessWidget {
  final Future<List<List<StoriesModel>>> future;

  const CustomStoryAllUsers({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    List<StoriesModel>? allCurrnetStories = [];
    return SliverToBoxAdapter(
      child: CustomStoryCover(
        child: FutureBuilder(
          future: getCurrentUserStory(),
          builder: (context, currentStorySnapshot) {
            if (currentStorySnapshot.hasData) {
              allCurrnetStories = currentStorySnapshot.data!;
            }
            return FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<List<StoriesModel>> storyDataList = snapshot.data!;
                  return ListView.builder(
                    itemCount: storyDataList.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == 0 && allCurrnetStories != null) {
                        return allCurrnetStories!.isNotEmpty
                            ? CustomStoryItemCurrentUsers(
                                stories: allCurrnetStories!,
                              )
                            : const CustomStoryCurrentNotFount();
                      }
                      return CustomStoryItemAllUsers(
                        firstStory: storyDataList[index - 1][0],
                        storyDatabasic: storyDataList,
                        initialPage: index - 1,
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const CustomStoryShimmer(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
