import 'widgets/story_viewer/story_viewer_body.dart';
import '../../data/model/stories_model.dart';
import '../controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryScreenViewerCurrentUsers extends StatelessWidget {
  final List<StoriesModel> storyDatabasic;
  const StoryScreenViewerCurrentUsers({
    super.key,
    required this.storyDatabasic,
  });

  @override
  Widget build(BuildContext context) {
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
        controller: pageController,
        itemCount: storyDatabasic.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => StoryViewerBody(
          storyData: storyDatabasic[index],
        ),
      ),
    );
  }
}
