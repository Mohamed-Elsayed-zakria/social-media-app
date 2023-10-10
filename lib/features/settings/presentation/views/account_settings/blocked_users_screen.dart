import '../widgets/account_settings/blocked_users/blocked_users_custom_person.dart';
import '../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../controllers/block_users_controller.dart';
import '../../../data/models/block_users_model.dart';
import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockedUsersScreen extends StatelessWidget {
  const BlockedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked users'.tr),
      ),
      body: FutureBuilder(
        future: getAllBlockUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) =>
                  const CustomPersonaListTileShimmer(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "There are no people blocked".tr,
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle18,
                  color: AppColors.kSurfaceColor,
                ),
              ),
            );
          } else {
            List<BlockUserModel> blockUserModel = snapshot.data ?? [];
            return ListView.builder(
              itemCount: blockUserModel.length,
              itemBuilder: (context, index) => BlockedUsersCustomPerson(
                blockUserModel: blockUserModel[index],
              ),
            );
          }
        },
      ),
    );
  }
}
