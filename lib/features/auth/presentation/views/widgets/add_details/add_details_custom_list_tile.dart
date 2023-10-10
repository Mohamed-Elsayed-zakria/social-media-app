import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class AddDetailsCustomListTile extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Icon? leading;
  final bool validator;
  final String errorMessage;

  const AddDetailsCustomListTile({
    super.key,
    required this.onTap,
    required this.title,
    this.leading,
    this.validator = true,
    required this.errorMessage,
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
              border: Border.all(
                color: validator
                    ? AppColors.kOnSurfaceVariantColor
                    : AppColors.kErrorColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListTile(
              onTap: onTap,
              title: Text(
                title,
                style: TextStyle(
                  color: validator
                      ? AppColors.kOnSurfaceColor
                      : AppColors.kErrorColor,
                ),
              ),
              leading: leading,
            ),
          ),
          Visibility(
            visible: validator != true,
            child: Container(
              margin: const EdgeInsets.only(right: 14, left: 14, top: 6),
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: AppColors.kErrorColor,
                  fontSize: AppStyle.kTextStyle12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
