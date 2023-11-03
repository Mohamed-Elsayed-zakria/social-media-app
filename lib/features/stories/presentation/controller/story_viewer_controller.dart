import 'package:story_view/story_view.dart';
import '../../../../core/constant/colors.dart';
import '../../data/model/stories_model.dart';

List<StoryItem> handleStory({
  required StoryController storyController,
  required List<StoriesModel> storiesModel,
}) {
  List<StoryItem> allStory = [];
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
