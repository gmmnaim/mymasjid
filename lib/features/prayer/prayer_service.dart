import 'dart:convert';
import 'package:http/http.dart' as http;

class PrayerService {

  Future<Map<String,dynamic>> fetchPrayer() async {

    final res = await http.get(
      Uri.parse("https://hidayahsmart.solutions/prayer-times/get_prayer_times_v2.php"),
    );

    if(res.statusCode==200){
      return jsonDecode(res.body);
    }else{
      throw Exception();
    }
  }
}
