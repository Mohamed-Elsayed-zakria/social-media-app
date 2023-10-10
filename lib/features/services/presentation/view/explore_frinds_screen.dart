import 'package:get/get.dart';

import '../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../controller/explore_frinds_controller.dart';
import '../../data/model/explore_frinds_model.dart';
import 'widgets/explore_frinds_screen_body.dart';
import 'package:flutter/material.dart';

class ExploreFrindsScreen extends StatelessWidget {
  const ExploreFrindsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore frinds'.tr,
        ),
      ),
      body: FutureBuilder(
        future: getUserDataToExploreFrinds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              children: [
                CustomPersonaListTileShimmer(),
                CustomPersonaListTileShimmer(),
              ],
            );
          } else {
            List<ExploreFrindsModel> userData = [];
            final allUserData = snapshot.data!.docs;
            userData = allUserData
                .map((element) => ExploreFrindsModel.fromJson(element.data()))
                .toList();
            return ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) => ExploreFrindsScreenBody(
                userData: userData[index],
              ),
            );
          }
        },
      ),
    );
  }
}
