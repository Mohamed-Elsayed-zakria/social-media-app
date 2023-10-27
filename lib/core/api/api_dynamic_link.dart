import 'package:flash/features/profile/presentation/views/profile_screen.dart';
import '../../features/posts/presentation/views/widgets/custom_post/custom_post_details.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flash/core/api/api_service.dart';
import 'package:get/get.dart';

import '../../features/reels/presentation/views/show_reels_screen.dart';

abstract class ApiDynamicLink {
  static Future<String> createDynamicLink({
    required bool short,
    required String id,
    required String type,
  }) async {
    String linkMessage;
    String pathUrl;
    if (type == TypeDynamicLink.post.name) {
      pathUrl = 'https://flashxapp.page.link/postUid?id=$id';
    } else if (type == TypeDynamicLink.personalPageUrl.name) {
      pathUrl = 'https://flashxapp.page.link/personalPageUrl?id=$id';
    } else {
      pathUrl = 'https://flashxapp.page.link/reelsUid?id=$id';
    }

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://flashxapp.page.link',
      link: Uri.parse(pathUrl),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.flash',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await ApiService.dynamicLinks.buildShortLink(
        parameters,
      );
      url = shortLink.shortUrl;
    } else {
      url = await ApiService.dynamicLinks.buildLink(
        parameters,
      );
    }

    linkMessage = url.toString();
    return linkMessage;
  }

  static Future<void> initDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    bool? isPost = deepLink?.pathSegments.contains('postUid') ?? false;
    bool? isPersonalPage =
        deepLink?.pathSegments.contains('personalPageUrl') ?? false;
    bool? isReels = deepLink?.pathSegments.contains('reelsUid') ?? false;
    
    if (deepLink != null) {
      final id = deepLink.queryParameters['id'];
      if (id != null && isPost) {
        Get.to(() => CustomPostDetails(postUid: id));
      } else if (id != null && isPersonalPage) {
        Get.to(() => ProfileScreen(otherUid: id));
      } else if (id != null && isReels) {
        Get.to(() => ShowReelsScreen(specificVideo: id));
      }
    }
  }
}

enum TypeDynamicLink { post, personalPageUrl, reels }
