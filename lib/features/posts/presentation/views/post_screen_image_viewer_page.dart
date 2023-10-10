import '../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PostScreenImageViewerPage extends StatelessWidget {
  final String imagePath;

  const PostScreenImageViewerPage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: Center(
        child: Image.file(
          File(imagePath),
          width: double.infinity,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
