import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DateTime> getServerTime() async {
  var response = await http.get(
    Uri.parse('http://worldclockapi.com/api/json/est/now'),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    String serverTimeString = data['currentDateTime'];
    DateTime serverTime = DateTime.parse(serverTimeString);
    return serverTime;
  } else {
    throw Exception('Failed to load server time');
  }
}

DateTime currentTimeDevice() {
  return DateTime.timestamp();
}
