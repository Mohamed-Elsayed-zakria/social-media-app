import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/constant.dart';
import '../../models/settings_exit_model.dart';
import '../settings_screen_repo.dart';

class SettingsScreenApi extends SettingsScreenRepo {
  @override
  Future<void> exitFromApp() async {
    SettingsExitModel settingsExitModel = SettingsExitModel(token: '');
    await ApiService.firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .update(settingsExitModel.toJson())
        .then((value) => ApiService.auth.signOut());
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getuserDataToSettings() {
    return ApiService.firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .snapshots();
  }
}
