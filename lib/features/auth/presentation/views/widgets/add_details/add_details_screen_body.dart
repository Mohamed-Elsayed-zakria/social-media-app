import 'add_details_custom_circle_avatar.dart';
import 'add_details_buttom_continue.dart';
import 'package:flutter/material.dart';
import 'add_details_data_taking.dart';

class AddDetailsScreenBody extends StatelessWidget {
  const AddDetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AddDetailsCustomCircleAvatar(),
            AddDetailsDataTaking(),
            AddDetailsButtomContintue(),
          ],
        ),
      ),
    );
  }
}
