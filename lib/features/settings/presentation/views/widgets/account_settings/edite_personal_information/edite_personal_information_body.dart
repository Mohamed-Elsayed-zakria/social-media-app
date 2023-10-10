import 'edite_personal_take_first_last_user_name.dart';
import 'edite_personal_buttom_update.dart';
import 'package:flutter/material.dart';
import 'edite_personal_take_age.dart';

class EditePersonalInformationScreenBody extends StatelessWidget {
  const EditePersonalInformationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            EditePersonalTakeFirstLastUserName(),
            EditePersonalTakeAge(),
            EditePersonalButtomUpdate(),
          ],
        ),
      ),
    );
  }
}
