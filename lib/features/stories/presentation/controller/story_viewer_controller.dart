import '../../../../core/constant/colors.dart';
import '../../data/model/stories_model.dart';
import 'package:story_view/story_view.dart';
import 'package:get/get.dart';

RxInt storyPosition = 0.obs;

List<StoryItem> handleStory({
  required StoryController storyController,
  required List<StoryItem> allStory,
  required List<StoriesModel> storiesModel,
}) {
  for (var element in storiesModel) {
    if (element.type == TypeStoryUploade.text.name) {
      allStory.add(
        StoryItem.text(
          title: element.description ?? '',
          backgroundColor: AppColors.kPrimaryColor,
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
