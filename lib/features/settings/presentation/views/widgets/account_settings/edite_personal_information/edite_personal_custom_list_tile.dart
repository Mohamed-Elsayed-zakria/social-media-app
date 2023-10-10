import 'package:flutter/material.dart';
import '../../../../../../../core/constant/colors.dart';

class EditePersonalCustomListTile extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Icon? leading;

  const EditePersonalCustomListTile({
    super.key,
    required this.onTap,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.kOnSurfaceVariantColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListTile(
              onTap: onTap,
              title: Text(
                title,
                style: const TextStyle(color: AppColors.kOnSurfaceColor),
              ),
              leading: leading,
            ),
          ),
        ],
      ),
    );
  }
}
