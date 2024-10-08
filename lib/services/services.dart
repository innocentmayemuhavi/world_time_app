import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worltime {
  late String location;
  late String time;
  late String flag;
  late String url;
  bool isDaytime = true;

  Worltime({
    required this.location,
    required this.flag,
    required this.url,
  });
  Future<void> getData() async {
    try {
      Response response =
           await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDaytime = now.hour > 6 && now.hour > 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Maye AI Failed to Get Time';
      print(e);
    }
  }
}
