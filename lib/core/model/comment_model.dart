class CommentModel {
  late String personalPicture;
  late bool verified;
  late String username;
  late String textComment;
  late String dataPublished;
  late String commentId;
  late String personUid;

  CommentModel({
    required this.commentId,
    required this.textComment,
    required this.dataPublished,
    required this.personUid,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'] ?? '';
    verified = json['verified'] ?? '';
    username = json['username'] ?? '';
    textComment = json['textComment'] ?? '';
    dataPublished = json['dataPublished'] ?? '';
    commentId = json['commentId'] ?? '';
    personUid = json['personUid'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['textComment'] = textComment;
    data['dataPublished'] = dataPublished;
    data['commentId'] = commentId;
    data['personUid'] = personUid;
    return data;
  }
}
