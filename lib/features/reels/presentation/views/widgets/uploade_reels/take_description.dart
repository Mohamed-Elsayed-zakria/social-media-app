import '../../../controller/uploade_reels_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeDescription extends StatelessWidget {
  const TakeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        maxLines: null,
        maxLength: 100,
        controller: getDescriptionReels,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
          hintText: 'Write a description'.tr,
        ),
      ),
    );
  }
}
