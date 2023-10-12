import 'package:get/get.dart';
import '../../../controllers/post_screen_controller.dart';
import 'package:flutter/material.dart';

class PostScreenDescription extends StatelessWidget {
  const PostScreenDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Form(
        key: addPostFormKey,
        child: TextFormField(
          validator: (value) => addNewPostvalidator(value: value),
          controller: getDescriptionText,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          maxLength: 500,
          decoration:  InputDecoration(
            counterText: '',
            hintText: "What are you thinking about".tr,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
