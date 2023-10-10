class NoticeModel {
  late String personalPicture;
  late String username;
  late bool verified;
  late String type;
  late String datePublished;
  late String personUid;
  late String textTitle;
  late String textBody;
  late String sentTo;

  NoticeModel({
    required this.type,
    required this.personUid,
    required this.textTitle,
    required this.textBody,
    required this.sentTo,
  });

  NoticeModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'] ?? '';
    username = json['username'] ?? '';
    verified = json['verified'] ?? false;
    type = json['type'] ?? '';
    datePublished = json['datePublished'] ?? '2013-09-27 00:00:00.000';
    personUid = json['personUid'] ?? '';
    textTitle = json['textTitle'] ?? '';
    textBody = json['textBody'] ?? '';
    sentTo = json['sentTo'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['personalPicture'] = personalPicture;
    data['username'] = username;
    data['verified'] = verified;
    data['type'] = type;
    data['datePublished'] = datePublished;
    data['personUid'] = personUid;
    data['textTitle'] = textTitle;
    data['textBody'] = textBody;
    data['sentTo'] = sentTo;

    return data;
  }
}

enum NoticeType { chat, profile, post }
