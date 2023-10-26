import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../../models/settings_exit_model.dart';
import '../settings_screen_repo.dart';

class SettingsScreenApi extends SettingsScreenRepo {
  @override
  Future<void> exitFromApp() async {
    SettingsExitModel settingsExitModel = SettingsExitModel(token: '');
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update(settingsExitModel.toJson())
        .then((value) => ApiService.auth.signOut());
  }
}
