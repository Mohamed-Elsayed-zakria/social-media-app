import 'get_current_date_time.dart';
import 'package:intl/intl.dart';


abstract class MyDateUtil {
  static String convertDateTime({required String historyAsText}) {
    final DateTime dateTime = DateTime.parse(historyAsText);
    final DateTime now = currentTimeDevice();
    final Duration difference = now.difference(dateTime);
    if (difference.inSeconds < 3) {
      return 'now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} second ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else if (difference.inHours < 48) {
      return 'yesterday';
    } else {
      return DateFormat('MMMM d, ' 'y').format(dateTime);
    }
  }
}
