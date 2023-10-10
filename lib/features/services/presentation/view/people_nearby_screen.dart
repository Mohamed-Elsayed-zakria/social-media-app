import '../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../controller/people_nearby_controller.dart';
import '../../data/model/people_nearby_model.dart';
import 'widgets/people_nearby_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeopleNearbyScreen extends StatefulWidget {
  const PeopleNearbyScreen({super.key});

  @override
  State<PeopleNearbyScreen> createState() => _PeopleNearbyScreenState();
}

class _PeopleNearbyScreenState extends State<PeopleNearbyScreen> {
  @override
  void initState() {
    super.initState();
    getLocationPeopleNearby();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'People nearby'.tr,
        ),
      ),
      body: Obx(
        () => getPeopleNearbyIsLoding.value
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: getUserDataToPeopleNearby(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      children: [
                        CustomPersonaListTileShimmer(),
                        CustomPersonaListTileShimmer(),
                      ],
                    );
                  } else {
                    List<PeopleNearbyModel> userData = [];

                    final allUserData = snapshot.data!.docs;
                    userData = allUserData
                        .map((element) =>
                            PeopleNearbyModel.fromJson(element.data()))
                        .where(
                          (model) =>
                              model.latitude != '0' && model.longitude != '0',
                        )
                        .toList();
                    return ListView.builder(
                      itemCount: userData.length,
                      itemBuilder: (context, index) => PeopleNearbyScreenBody(
                        userData: userData[index],
                        currentLatitude: currentLatitude,
                        currentLongitude: currentLongitude,
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
