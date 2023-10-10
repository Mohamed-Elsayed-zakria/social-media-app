import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../controllers/custom_post_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../../core/constant/colors.dart';
import 'custom_post_show_single_image.dart';
import 'custom_post_show_multi_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCustomImages extends StatelessWidget {
  final List urlImages;

  const PostCustomImages({
    super.key,
    required this.urlImages,
  });

  @override
  Widget build(BuildContext context) {
    return urlImages.length > 1
        ? Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider.builder(
                carouselController: controller,
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  return CustomPostShowMultiImage(urlImage: urlImages[index]);
                },
                options: CarouselOptions(
                  aspectRatio: 13 / 9,
                  viewportFraction: 1,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) => activeIndex.value = index,
                ),
              ),
              Positioned(
                bottom: 10,
                child: Obx(
                  () => AnimatedSmoothIndicator(
                    onDotClicked: controller.animateToPage,
                    effect: const WormEffect(
                      activeDotColor: AppColors.kPrimaryColor,
                      radius: 4,
                      dotHeight: 5,
                      dotWidth: 12,
                    ),
                    activeIndex: activeIndex.value,
                    count: urlImages.length,
                  ),
                ),
              ),
            ],
          )
        : CustomPostShowSingleImage(urlImage: urlImages[0]);
  }
}
