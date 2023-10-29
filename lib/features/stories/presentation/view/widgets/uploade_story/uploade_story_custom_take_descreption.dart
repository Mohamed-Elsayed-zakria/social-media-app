import '../../../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../data/model/stories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadeStoryCustomTakeDescreption extends StatelessWidget {
  final TypeStoryUploade type;

  const UploadeStoryCustomTakeDescreption({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return type == TypeStoryUploade.image || type == TypeStoryUploade.vedio
        ? Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: TextFormField(
              controller: getTextStory,
              maxLines: null,
              maxLength: 300,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write something'.tr,
                counterText: '',
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: size.height * .5,
            child: TextFormField(
              controller: getTextStory,
              maxLines: null,
              maxLength: 300,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write something'.tr,
                counterText: '',
              ),
            ),
          );
  }
}
