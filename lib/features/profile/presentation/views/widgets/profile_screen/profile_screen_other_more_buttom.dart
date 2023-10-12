import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/profile_model.dart';
import '../../../controller/profile_edite_more_controller.dart';

class ProfileScreenOtherMoreButtom extends StatelessWidget {
  final ProfileScreenModel userData;

  const ProfileScreenOtherMoreButtom({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userData.listBlock.contains(ApiService.user.uid)
              ? ListTile(
                  onTap: () async {
                    await deleteUserFromListBlock(
                      otherUid: userData.personalUid,
                    );
                    Fluttertoast.showToast(
                      msg: "Done unBlock the user".tr,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    Get.back();
                  },
                  leading: const Icon(
                    IconlyBroken.infoSquare,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text("unBlock".tr),
                )
              : ListTile(
                  onTap: () async {
                    await addUserToListBlock(otherUid: userData.personalUid);
                    Fluttertoast.showToast(
                      msg: "The user has been blocked".tr,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    );
                    Get.back();
                  },
                  leading: const Icon(
                    IconlyBroken.infoSquare,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text("Block".tr),
                ),
          ListTile(
            onTap: () {
              Clipboard.setData(
                ClipboardData(
                  text: userData.personalPageUrl,
                ),
              );
              Fluttertoast.showToast(
                msg: "The text has been copied".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              Get.back();
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_rounded,
              size: 26,
            ),
            title: Text(
              "Copy the page link".tr,
            ),
          ),
        ],
      ),
    );
  }
}
