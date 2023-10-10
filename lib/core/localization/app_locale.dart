import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';

class AppLocalization implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": ar,
        "en": en,
      };
}
