import '../../../../core/constant/colors.dart';
import 'widgets/profile_screen/profile_screen_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String otherUid;
  const ProfileScreen({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: ProfileScreenBody(otherUid: otherUid),
    );
  }
}
