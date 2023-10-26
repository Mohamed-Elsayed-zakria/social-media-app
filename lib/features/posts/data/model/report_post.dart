class ReportPost {
  late String idMakeReport;
  late String postUid;
  late String idMakePost;
  late String description;
  late List imgUrl;
  late String videoUrl;
  late String datePublished;
  ReportPost({
    required this.idMakeReport,
    required this.postUid,
    required this.idMakePost,
    required this.description,
    required this.imgUrl,
    required this.videoUrl,
    required this.datePublished,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['idMakeReport'] = idMakeReport;
    data['postUid'] = postUid;
    data['idMakePost'] = idMakePost;
    data['description'] = description;
    data['imgUrl'] = imgUrl;
    data['videoUrl'] = videoUrl;
    data['datePublished'] = datePublished;
    return data;
  }
}
