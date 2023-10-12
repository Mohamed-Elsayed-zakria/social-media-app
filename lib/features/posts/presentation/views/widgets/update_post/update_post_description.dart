import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/post_model.dart';
import '../../../controllers/update_post_controller.dart';

class UpdatePostDescription extends StatelessWidget {
  final PostModel postData;

  const UpdatePostDescription({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    updatePostController.text = postData.description;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Form(
        key: updatePostFormKey,
        child: TextFormField(
          validator: (value) => updatePostvalidator(value: value),
          controller: updatePostController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          maxLength: 250,
          decoration: InputDecoration(
            counterText: '',
            hintText: "What are you thinking about".tr,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
