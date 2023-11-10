import '../../data/repository/api/update_post_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

TextEditingController updatePostController = TextEditingController();
GlobalKey<FormState> updatePostFormKey = GlobalKey();
RxBool updatePostLoading = false.obs;

RxString updatePostSelectItem = ''.obs;

String? updatePostvalidator({required String? value}) {
  if (value!.isEmpty) {
    return 'You must add a description to the post'.tr;
  } else {
    return null;
  }
}

Future<void> updatePost({
  required String postUid,
  required String postStatus,
}) async {
  UpdatePostApi().updatePost(
    postUid: postUid,
    postStatus: postStatus,
  );
}
