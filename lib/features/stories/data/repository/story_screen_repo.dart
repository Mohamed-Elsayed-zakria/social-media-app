import '../model/stories_model.dart';

abstract class StoryScreenRepo {
  Future<void> uploadeStory({
    required int durationTime,
    required String type,
    String? description,
    String? imgPath,
  });
  Future<void> deleteStory({required String storyUid});
  Future<void> reportStory({required StoriesModel storyData});
}
