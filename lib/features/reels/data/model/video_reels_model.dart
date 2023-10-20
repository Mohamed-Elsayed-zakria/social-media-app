class VideoReelsModel {
  late String username;
  late String personalPicture;
  late String? description;
  late String videoUrl;
  late String personUid;
  late String videoUid;
  late String datePublished;
  late String postUrl;
  late String postStatus;
  late bool verified;

  VideoReelsModel({
    required this.description,
    required this.videoUrl,
    required this.personUid,
    required this.videoUid,
    required this.datePublished,
    required this.postUrl,
    required this.postStatus,
  });

  VideoReelsModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    personalPicture = json['personalPicture'] ?? '';
    description = json['description'] ?? '';
    videoUrl = json['videoUrl'] ?? '';
    personUid = json['personUid'] ?? '';
    videoUid = json['videoUid'] ?? '';
    datePublished = json['datePublished'] ?? '';
    postUrl = json['postUrl'] ?? '';
    postStatus = json['postStatus'] ?? '';
    verified = json['verified'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['videoUrl'] = videoUrl;
    data['personUid'] = personUid;
    data['videoUid'] = videoUid;
    data['datePublished'] = datePublished;
    data['postUrl'] = postUrl;
    data['postStatus'] = postStatus;

    return data;
  }
}
