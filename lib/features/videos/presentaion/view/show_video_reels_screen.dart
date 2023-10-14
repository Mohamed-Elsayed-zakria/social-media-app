import 'package:flutter/material.dart';
import '../../../../core/constant/colors.dart';
import '../../data/model/video_reels_model.dart';
import '../controller/show_video_reels_controller.dart';
import 'widgets/show_video_reels/show_video_reels_body.dart';

class ShowVideoReelsScreen extends StatelessWidget {
  const ShowVideoReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: FutureBuilder(
        future: getAllReels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('There are no Video'));
          } else {
            List<VideoReelsModel> allReels = snapshot.data ?? [];
            return PageView.builder(
              itemCount: allReels.length,
              scrollDirection: Axis.vertical,
              controller: PageController(initialPage: 0, viewportFraction: 1),
              itemBuilder: (context, index) {
                return ShowVideoReelsBody(allReels: allReels[index]);
              },
            );
          }
        },
      ),
    );
  }
}
