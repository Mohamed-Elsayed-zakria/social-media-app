import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileScreenUsernameAndFullnameAndVerified extends StatelessWidget {
  final ProfileScreenModel userData;

  const ProfileScreenUsernameAndFullnameAndVerified({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${userData.firstName} ${userData.lastName}",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                textDirection: TextDirection.ltr,
                "@${userData.username}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Visibility(
                visible: userData.verified,
                child: const Icon(
                  Icons.verified,
                  color: AppColors.kPrimaryColor,
                  size: 17,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
