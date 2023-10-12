import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../../core/constant/colors.dart';

class CommentsNotFount extends StatelessWidget {
  const CommentsNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Icon(
          color: AppColors.kPrimaryColor,
          IconlyBroken.chat,
          size: 80,
        ),
        SizedBox(height: 25),
        Text(
          'There are no comments yet',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
