class CommentModel {
  late String username;
  late String textComment;
  late String dataPublished;
  late String commentId;
  late String personUid;
  late List likes;

  CommentModel({
    required this.username,
    required this.commentId,
    required this.textComment,
    required this.dataPublished,
    required this.personUid,
    required this.likes,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    textComment = json['textComment'] ?? '';
    dataPublished = json['dataPublished'] ?? '';
    commentId = json['commentId'] ?? '';
    likes = json['likes'] ?? [];
    personUid = json['personUid'] ?? '';
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['username'] = username;
    data['textComment'] = textComment;
    data['dataPublished'] = dataPublished;
    data['commentId'] = commentId;
    data['likes'] = likes;
    data['personUid'] = personUid;
    return data;
  }
}
