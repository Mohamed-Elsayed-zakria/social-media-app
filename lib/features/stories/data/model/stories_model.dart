class StoriesModel {
  late String? imgPath;
  late String? vedioUrl;
  late String? description;
  late String personUid;
  late String datePublish;
  late String type;
  late String personalPicture;
  late List followingList;
  late String username;
  late bool verified;

  StoriesModel({
    required this.imgPath,
    required this.vedioUrl,
    required this.personUid,
    required this.datePublish,
    required this.type,
    this.description,
  });
  StoriesModel.fromJson(Map<String, dynamic> json) {
    imgPath = json['imgPath'] ?? '';
    vedioUrl = json['vedioUrl'] ?? '';
    description = json['description'] ?? '';
    datePublish = json['datePublish'] ?? '';
    personUid = json['personUid'] ?? '';
    personalPicture = json['personalPicture'] ?? '';
    followingList = json['following'] ?? [];
    username = json['username'] ?? '';
    personUid = json['personUid'] ?? '';
    verified = json['verified'] ?? false;
    type = json['type'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgPath'] = imgPath;
    data['vedioUrl'] = vedioUrl;
    data['description'] = description;
    data['datePublish'] = datePublish;
    data['personUid'] = personUid;
    data['type'] = type;
    return data;
  }
}

enum TypeStoryUploade { image, vedio, text }
