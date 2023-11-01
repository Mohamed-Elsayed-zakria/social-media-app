abstract class StoryScreenRepo {
  Future<void> uploadeStory({
    required String type,
    String? description,
    String? imgPath,
  });
}
