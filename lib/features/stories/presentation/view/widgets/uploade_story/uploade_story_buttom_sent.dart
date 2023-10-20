import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../../../data/model/stories_model.dart';
import '../../../controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryButtomSent extends StatelessWidget {
  final TypeStoryUploade type;
  final String? imagePathStory;

  const UploadeStoryButtomSent({
    super.key,
    this.imagePathStory,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Obx(
        () => uploadeStoryIsLoading.value
            ? const CircularProgressIndicator()
            : CustomButton(
                onPressed: () => uploadeStory(
                  description: getTextStory.text,
                  imgPath: imagePathStory,
                  vedioPath: vedioPath,
                  type: type.name,
                ),
                text: 'Share'.tr,
              ),
      ),
    );
  }
}
