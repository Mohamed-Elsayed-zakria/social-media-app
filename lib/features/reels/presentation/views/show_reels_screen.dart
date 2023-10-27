import 'package:flutter/material.dart';
import '../../../../core/constant/colors.dart';
import '../../data/model/video_reels_model.dart';
import '../controller/show_reels_controller.dart';
import 'widgets/show_reels/show_reels_no_internet.dart';
import 'widgets/show_reels/show_reels_not_fount.dart';
import 'widgets/show_reels/show_video_reels_body.dart';

class ShowReelsScreen extends StatelessWidget {
  final String? specificVideo;
  const ShowReelsScreen({
    super.key,
    this.specificVideo,
  });

  @override
  Widget build(BuildContext context) {
    int initialPage = 0;
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: FutureBuilder(
        future: getAllReels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return const ShowReelsNotFount();
          } else if (!snapshot.hasData || snapshot.hasError) {
            return const ShowReelsNoInternet();
          } else {
            List<VideoReelsModel> allReels = snapshot.data ?? [];
            if (specificVideo != null) {
              for (int i = 0; i < allReels.length; i++) {
                if (allReels[i].videoUid == specificVideo) {
                  initialPage = i;
                }
              }
            }
            return PageView.builder(
              controller: PageController(initialPage: initialPage),
              itemCount: allReels.length,
              scrollDirection: Axis.vertical,
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
