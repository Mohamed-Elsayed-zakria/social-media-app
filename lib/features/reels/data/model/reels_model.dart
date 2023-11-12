class ReelsModel {
  late String username;
  late String personalPicture;
  late String? description;
  late String videoUrl;
  late String personUid;
  late String reelUid;
  late String datePublished;
  late String postUrl;
  late String postStatus;
  late bool verified;

  ReelsModel({
    required this.description,
    required this.videoUrl,
    required this.personUid,
    required this.reelUid,
    required this.datePublished,
    required this.postUrl,
    required this.postStatus,
  });

  ReelsModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    personalPicture = json['personalPicture'] ?? '';
    description = json['description'] ?? '';
    videoUrl = json['videoUrl'] ?? '';
    personUid = json['personUid'] ?? '';
    reelUid = json['reelUid'] ?? '';
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
    data['reelUid'] = reelUid;
    data['datePublished'] = datePublished;
    data['postUrl'] = postUrl;
    data['postStatus'] = postStatus;

    return data;
  }
}
