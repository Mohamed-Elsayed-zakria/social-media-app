import 'package:icon_broken/icon_broken.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../../../core/widgets/custom_shimmer.dart';

class CustomPostShimmer extends StatelessWidget {
  const CustomPostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Card(
      color: AppColors.kSurfaceColor,
      child: Column(
        children: [
          ListTile(
            leading: const CustomShimmer(
              child: CircleAvatar(
                radius: 28,
              ),
            ),
            title: CustomShimmer(
              child: Container(
                color: AppColors.kSurfaceColor,
                height: 15,
              ),
            ),
            subtitle: CustomShimmer(
              child: Container(
                color: AppColors.kSurfaceColor,
                height: 10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
            child: CustomShimmer(
              child: Container(
                width: double.infinity,
                height: size.height * .4,
                decoration: BoxDecoration(
                  color: AppColors.kSurfaceColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const CustomShimmer(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomShimmer(
                      child: Icon(
                        IconBroken.Heart,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 6),
                    CustomShimmer(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: AppStyle.kTextStyle18,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomShimmer(
                      child: Icon(
                        IconBroken.More_Square,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 6),
                    CustomShimmer(
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: AppStyle.kTextStyle18,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomShimmer(
                  child: Icon(
                    IconBroken.Send,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
