import '../../../../data/model/post_model.dart';
import '../post_screen/post_screen_header.dart';
import 'update_post_custom_drop_down_menu.dart';
import 'uplate_post_header_loading.dart';
import 'package:flutter/material.dart';
import 'update_post_description.dart';

class UpdatePostScreenBody extends StatelessWidget {
  final PostModel postData;

  const UpdatePostScreenBody({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              const UpdatePostHeaderLoading(),
              const PostScreenHeader(),
              UpdatePostDescription(postData: postData),
            ],
          ),
        ),
         UpdatePostCustomDropDownMenu(postData: postData),
      ],
    );
  }
}
