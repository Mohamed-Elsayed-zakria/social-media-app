import 'package:ntp/ntp.dart';

Future<DateTime> getServerTime() async {
  DateTime currentDate = await NTP.now();
  return currentDate;
}

DateTime currentTimeDevice() {
  return DateTime.timestamp();
}
