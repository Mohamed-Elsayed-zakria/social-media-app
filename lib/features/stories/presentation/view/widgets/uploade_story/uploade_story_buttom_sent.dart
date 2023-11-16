import '../../../../../../core/constant/style.dart';
import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../../../data/model/stories_model.dart';
import '../../../controller/uploade_story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryButtomSent extends StatelessWidget {
  final TypeStoryUploade type;
  final String? imagePathStory;
  final int durationTime;

  const UploadeStoryButtomSent({
    super.key,
    this.imagePathStory,
    required this.type,
    required this.durationTime,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        onPressed: uploadeStoryIsLoading.value == false
            ? () {
                // primaryColor,
                // teal,
                // deepPurple,
                // red,
                // orange,
                // blueGrey,

                if (type == TypeStoryUploade.text) {
                  if (getTextStory.text.isNotEmpty) {
                    String color = StoryColor.primaryColor.name;
                    switch (selectColorIndex) {
                      case 1:
                        color = StoryColor.teal.name;
                        break;
                      case 2:
                        color = StoryColor.deepPurple.name;
                        break;
                      case 3:
                        color = StoryColor.red.name;
                        break;
                      case 4:
                        color = StoryColor.orange.name;
                        break;
                      case 5:
                        color = StoryColor.blueGrey.name;
                        break;
                    }
                    uploadeStory(
                      durationTime: durationTime,
                      description: getTextStory.text,
                      imgPath: imagePathStory,
                      color: color,
                      type: type.name,
                    );
                  }
                } else {
                  uploadeStory(
                    durationTime: durationTime,
                    description: getTextStory.text,
                    imgPath: imagePathStory,
                    type: type.name,
                  );
                }
              }
            : null,
        child: Text(
          'Share'.tr,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle18,
          ),
        ),
      ),
    );
  }
}
