class PostModel {
  late String username;
  late String personalPicture;
  late String description;
  late String videoUrl;
  late String personUid;
  late String postUid;
  late String datePublished;
  late String postUrl;
  late String postStatus;
  late bool verified;
  late List imgUrl;

  PostModel({
    required this.description,
    required this.videoUrl,
    required this.personUid,
    required this.postUid,
    required this.datePublished,
    required this.postUrl,
    required this.postStatus,
    required this.imgUrl,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    personalPicture = json['personalPicture'] ?? '';
    description = json['description'] ?? '';
    videoUrl = json['videoUrl'] ?? '';
    personUid = json['personUid'] ?? '';
    postUid = json['postUid'] ?? '';
    datePublished = json['datePublished'] ?? '';
    postUrl = json['postUrl'] ?? '';
    postStatus = json['postStatus'] ?? '';
    verified = json['verified'] ?? false;
    imgUrl = json['imgUrl'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['videoUrl'] = videoUrl;
    data['personUid'] = personUid;
    data['postUid'] = postUid;
    data['datePublished'] = datePublished;
    data['postUrl'] = postUrl;
    data['postStatus'] = postStatus;
    data['imgUrl'] = imgUrl;

    return data;
  }
}
