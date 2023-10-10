import 'verification_uploade_personal_image.dart';
import 'verification_get_fullname_message.dart';
import 'verification_buttom_sent_data.dart';
import 'verification_header_message.dart';
import 'package:flutter/material.dart';
import 'verification_picture_id.dart';

class VerificationScreenBody extends StatelessWidget {
  const VerificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            VerificationHeaderMessage(),
            VerificationUploadePersonalImage(),
            VerificationPictureId(),
            VerificationGetFullnameMessage(),
            VerificationButtomSentData(),
          ],
        ),
      ),
    );
  }
}
