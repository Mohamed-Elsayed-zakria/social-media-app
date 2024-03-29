import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../presentation/controllers/add_details_controller.dart';
import '../../../../../core/constant/default_personal_images.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/api/api_dynamic_link.dart';
import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/add_details_screen_model.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../add_details_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class AddDetailsScreenApi extends AddDetailsScreenRepo {
  @override
  Future<bool> isUsernameTaken({
    required String username,
  }) async {
    addDetailsIsLodinge.value = true;
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  @override
  Future<void> addUserDataToDatabase({required String username}) async {
    addDetailsIsLodinge.value = true;
    String generatPersonalImageId = const Uuid().v1();
    if (addDetailsImgPath != null) {
      final storageRef = ApiService.fireStorage.ref(
        "user-files/${ApiService.user.uid}/images/personal-image/$generatPersonalImageId.jpg",
      );
      await storageRef.putFile(addDetailsImgPath!);
      urlPersonalPicture = await storageRef.getDownloadURL();
    } else {
      if (gender.value == "FeMale") {
        urlPersonalPicture = DefaultPersonalImage.urlPhotoFemale;
      } else {
        urlPersonalPicture = DefaultPersonalImage.urlPhotoMale;
      }
    }
    if (await isUsernameTaken(username: username)) {
      addDetailsIsLodinge.value = false;
      snackBar(isError: true,message: "username Already Taken".tr);
    } else {
      if (gender.value == "ذكر") {
        gender.value = "Male";
      } else if (gender.value == "أنثى") {
        gender.value = "Female";
      }
      String personalPageUrl = await ApiDynamicLink.createDynamicLink(
        type: TypeDynamicLink.personalPageUrl.name,
        id: ApiService.user.uid,
        short: false,
      );
      String? myToken = await ApiFirebaseMessaging.getToken();
      CreateAccount createAccount = CreateAccount(
        firstName: addDetailsGetFirstName.text,
        lastName: addDetailsGetLastName.text,
        personalPicture: urlPersonalPicture,
        coverPhoto: DefaultPersonalImage.urlCoverPhoto,
        personUid: ApiService.user.uid,
        personalPageUrl: personalPageUrl,
        bio: 'welcome to my profile',
        age: dateOfBirth.toString(),
        gender: gender.value,
        username: username,
        isOnline: false,
        verified: false,
        followers: [],
        following: [],
        listBlock: [],
        latitude: 0,
        longitude: 0,
        token: myToken,
      );
      ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .set(createAccount.toJson())
          .then(
        (value) async {
          DocumentSnapshot<Map<String, dynamic>> currentUserData =
              await ApiService.firestore
                  .collection(Collections.userCollection)
                  .doc(ApiService.user.uid)
                  .get();
          CurrentUserData.fromJson(currentUserData.data()!);
          addDetailsIsLodinge.value = false;
          Get.offAll(() => const MainHomeScreen());
          addDetailsGetUsername.clear();
          addDetailsGetFirstName.clear();
          addDetailsGetLastName.clear();
        },
      ).catchError((error) {
        addDetailsIsLodinge.value = false;
      });
    }
  }
}
