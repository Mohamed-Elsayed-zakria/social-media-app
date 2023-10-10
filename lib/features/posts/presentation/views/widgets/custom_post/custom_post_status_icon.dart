import 'package:flutter/material.dart';
import '../../../../data/model/post_model.dart';

class CustomPostStatusIcon extends StatelessWidget {
  final PostModel postData;

  const CustomPostStatusIcon({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return postData.postStatus == "Public"
        ? const Icon(
            Icons.public,
            size: 17,
          )
        : postData.postStatus == "Followers"
            ? const Icon(
                Icons.people_outline,
                size: 18,
              )
            : const Icon(
                Icons.lock_outlined,
                size: 17,
              );
  }
}
