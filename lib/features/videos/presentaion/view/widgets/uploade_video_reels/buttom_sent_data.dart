import '../../../controller/uploade_video_reels_controller.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ButtomSentData extends StatelessWidget {
  final File addVideoReelsPath;

  const ButtomSentData({
    super.key,
    required this.addVideoReelsPath,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);

    return SizedBox(
      width: size.width * .25,
      child: CustomButton(
        onPressed: () {
          uploadeVideoReels(
            vedioPath: addVideoReelsPath,
            description: getDescriptionReels?.text,
          );
        },
        text: 'Share',
      ),
    );
  }
}
