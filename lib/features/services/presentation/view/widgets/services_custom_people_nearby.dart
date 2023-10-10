import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../controller/people_nearby_controller.dart';
import 'package:flutter/material.dart';

class ServicesCustomPeopleNearby extends StatelessWidget {
  const ServicesCustomPeopleNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => checkLocationSettings(),
        title: Text('People nearby'.tr),
        leading: ClipOval(
          child: Container(
            color: const Color.fromARGB(176, 255, 146, 146),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.gps_fixed,
              size: 28,
              color: Color.fromARGB(255, 230, 69, 69),
            ),
          ),
        ),
        trailing: const Icon(IconBroken.Arrow___Right_2),
      ),
    );
  }
}
