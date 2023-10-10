import '../../../../../core/widgets/custom_persona_list_tile_shimmer.dart';
import '../../../data/model/notice_model.dart';
import '../../controller/notice_controller.dart';
import 'custom_notification_card.dart';
import 'package:flutter/material.dart';
import 'notice_screen_not_found.dart';

class NoticeScreenBody extends StatelessWidget {
  const NoticeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllNotification(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) => const CustomPersonaListTileShimmer(),
            ),
          );
        } else if (snapshot.data!.isEmpty || !snapshot.hasData) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: NoticeScreenNotFound(),
          );
        } else {
          NoticeModel allNotification;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data!.length,
              (context, index) {
                allNotification = snapshot.data![index];
                return CustomNotificationCard(allNotification: allNotification);
              },
            ),
          );
        }
      },
    );
  }
}
