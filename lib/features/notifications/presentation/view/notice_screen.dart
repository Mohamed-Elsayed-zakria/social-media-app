import 'widgets/notice_screen_custom_appbar.dart';
import 'widgets/notice_screen_body.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            NoticeScreenCustomAppbar(),
            NoticeScreenBody(),
          ],
        ),
      ),
    );
  }
}
