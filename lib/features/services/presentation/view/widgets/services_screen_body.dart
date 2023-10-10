import 'package:flutter/material.dart';
import 'services_custom_explore_frinds.dart';
import 'services_custom_following.dart';
import 'saved_items/services_custom_saved_items.dart';
import 'services_custom_people_nearby.dart';
import 'services_custom_followers.dart';

class ServicesScreenBody extends StatelessWidget {
  const ServicesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ServicesCustomPeopleNearby(),
        ServicesCustomExploreFrinds(),
        ServicesCustomSavedItems(),
        ServicesCustomFollowers(),
        ServicesCustomFollowing(),
      ],
    );
  }
}
