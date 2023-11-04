import 'widgets/story_viewer/story_viewer_header.dart';
import '../controller/story_viewer_controller.dart';
import '../../data/model/stories_model.dart';
import 'package:story_view/story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryScreenViewerAllUsers extends StatefulWidget {
  final List<List<StoriesModel>> storyDatabasic;
  final int initialPage;

  const StoryScreenViewerAllUsers({
    super.key,
    required this.initialPage,
    required this.storyDatabasic,
  });

  @override
  State<StoryScreenViewerAllUsers> createState() =>
      _StoryScreenViewerAllUsersState();
}

class _StoryScreenViewerAllUsersState extends State<StoryScreenViewerAllUsers> {
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
    PageController pageControllerStory = PageController(
      initialPage: widget.initialPage,
    );
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 20 || details.primaryDelta! < -20) {
          Get.back();
        }
      },
      child: Scaffold(
        body: PageView.builder(
          controller: pageControllerStory,
          itemCount: widget.storyDatabasic.length,
          itemBuilder: (context, index) => Stack(
            children: [
              StoryView(
                inline: true,
                controller: storyController,
                progressPosition: ProgressPosition.top,
                storyItems: handleStory(
                  storiesModel: widget.storyDatabasic[index],
                  storyController: storyController,
                ),
                onStoryShow: (storyItem) {
                  storyPosition.value = allStory.indexOf(storyItem);
                },
                onComplete: () {
                  if (index <= widget.storyDatabasic.length - 1) {
                    pageControllerStory.animateToPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      index + 1,
                    );
                  }
                },
              ),
              Obx(
                () => StoryViewerHeader(
                  storyData: widget.storyDatabasic[index][storyPosition.value],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
