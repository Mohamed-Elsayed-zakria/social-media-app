import '../../data/model/stories_model.dart';
import '../controller/story_controller.dart';
import 'widgets/story_viewer/story_viewer_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryScreenViewerAllUsers extends StatelessWidget {
  final List<List<StoriesModel>> storyDatabasic;
  final int initialPage;

  const StoryScreenViewerAllUsers({
    super.key,
    required this.initialPage,
    required this.storyDatabasic,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageControllerStory = PageController(
      initialPage: initialPage,
    );
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
          Get.back();
        }
      },
      onTapDown: (details) => pressOnTheScreen(
        context: context,
        details: details,
      ),
      child: PageView.builder(
        controller: pageControllerStory,
        itemCount: storyDatabasic.length,
        itemBuilder: (context, userIndex) => PageView.builder(
          controller: pageController,
          itemCount: storyDatabasic[userIndex].length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, storyIndex) => StoryViewerBody(
            storyData: storyDatabasic[userIndex][storyIndex],
          ),
        ),
      ),
    );
  }
}
