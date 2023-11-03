abstract class StoryScreenRepo {
  Future<void> uploadeStory({
    required int durationTime,
    required String type,
    String? description,
    String? imgPath,
  });
}
