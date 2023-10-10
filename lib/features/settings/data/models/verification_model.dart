class VerificationModel {
  String fullname;
  String message;
  String? personalPicture;
  String? idPicture;
  String personUid;
  VerificationModel({
    required this.fullname,
    required this.message,
    required this.personalPicture,
    required this.idPicture,
    required this.personUid,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['fullname'] = fullname;
    data['message'] = message;
    data['personal-picture'] = personalPicture;
    data['id-picture'] = idPicture;
    data['personUid'] = personUid;
    return data;
  }
}
