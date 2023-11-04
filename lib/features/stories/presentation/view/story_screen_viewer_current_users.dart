import 'widgets/story_viewer/story_viewer_header.dart';
import '../controller/story_viewer_controller.dart';
import '../../data/model/stories_model.dart';
import 'package:story_view/story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryScreenViewerCurrentUsers extends StatefulWidget {
  final List<StoriesModel> storyDatabasic;
  const StoryScreenViewerCurrentUsers({
    super.key,
    required this.storyDatabasic,
  });

  @override
  State<StoryScreenViewerCurrentUsers> createState() =>
      _StoryScreenViewerCurrentUsersState();
}

class _StoryScreenViewerCurrentUsersState
    extends State<StoryScreenViewerCurrentUsers> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    storyPosition.value = 0;
    allStory = [];
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
          Get.back();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            StoryView(
              inline: true,
              controller: storyController,
              storyItems: handleStory(
                storiesModel: widget.storyDatabasic,
                storyController: storyController,
              ),
              onStoryShow: (storyItem) {
                storyPosition.value = allStory.indexOf(storyItem);
              },
              onComplete: () => Get.back(),
            ),
            Obx(
              () => StoryViewerHeader(
                storyData: widget.storyDatabasic[storyPosition.value],
              ),
            )
          ],
        ),
      ),
    );
  }
}
