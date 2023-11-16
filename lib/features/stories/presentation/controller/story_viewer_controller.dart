import '../../../../core/constant/colors.dart';
import '../../data/model/stories_model.dart';
import 'package:story_view/story_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt storyPosition = 0.obs;

List<StoryItem> handleStory({
  required StoryController storyController,
  required List<StoriesModel> storiesModel,
  required List<StoryItem> allStory,
}) {
  for (var element in storiesModel) {
    if (element.type == TypeStoryUploade.text.name) {
      Color backgroundColor = AppColors.kPrimaryColor;
      if (element.color == StoryColor.blueGrey.name) {
        backgroundColor = Colors.blueGrey;
      } else if (element.color == StoryColor.deepPurple.name) {
        backgroundColor = Colors.deepPurple;
      } else if (element.color == StoryColor.orange.name) {
        backgroundColor = Colors.orange;
      } else if (element.color == StoryColor.red.name) {
        backgroundColor = Colors.red;
      } else if (element.color == StoryColor.teal.name) {
        backgroundColor = Colors.blueGrey;
      }

      allStory.add(
        StoryItem.text(
          title: element.description ?? '',
          backgroundColor: backgroundColor,
          duration: Duration(seconds: element.durationTime),
        ),
      );
    } else if (element.type == TypeStoryUploade.image.name) {
      allStory.add(
        StoryItem.pageImage(
          url: element.imgPath!,
          caption: element.description,
          controller: storyController,
          duration: Duration(seconds: element.durationTime),
        ),
      );
    } else if (element.type == TypeStoryUploade.vedio.name) {
      allStory.add(
        StoryItem.pageVideo(
          element.vedioUrl!,
          controller: storyController,
          caption: element.description,
          duration: Duration(seconds: element.durationTime),
        ),
      );
    }
  }
  return allStory;
}
