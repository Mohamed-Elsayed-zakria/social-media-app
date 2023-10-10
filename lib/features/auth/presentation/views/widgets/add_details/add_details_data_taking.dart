import 'package:flutter/material.dart';
import 'add_details_taking_age.dart';
import 'add_details_taking_data.dart';
import 'add_details_taking_gender.dart';

class AddDetailsDataTaking extends StatelessWidget {
  const AddDetailsDataTaking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AddDetailsTakingData(),
        AddDetailsTakingAge(),
        AddDetailsTakingGender(),
      ],
    );
  }
}
