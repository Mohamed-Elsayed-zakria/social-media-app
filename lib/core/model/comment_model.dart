class CommentModel {
  late String personalPicture;
  late String commentType;
  late bool verified;
  late String username;
  late String textComment;
  late String imageUrlComment;
  late String dataPublished;
  late String commentId;
  late String personUid;

  CommentModel({
    required this.commentId,
    required this.commentType,
    required this.textComment,
    required this.imageUrlComment,
    required this.dataPublished,
    required this.personUid,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    personalPicture = json['personalPicture'] ?? '';
    commentType = json['commentType'] ?? '';
    verified = json['verified'] ?? '';
    username = json['username'] ?? '';
    textComment = json['textComment'] ?? '';
    imageUrlComment = json['imageUrlComment'] ?? '';
    dataPublished = json['dataPublished'] ?? '';
    commentId = json['commentId'] ?? '';
    personUid = json['personUid'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imageUrlComment'] = imageUrlComment;
    data['textComment'] = textComment;
    data['commentType'] = commentType;
    data['dataPublished'] = dataPublished;
    data['commentId'] = commentId;
    data['personUid'] = personUid;
    return data;
  }
}
enum CommentType{text,image}
