import 'dart:convert';
import 'package:http/http.dart' as http;

class HadithService {

  Future<List<dynamic>> fetchHadithList() async {

    final response = await http
        .get(
      Uri.parse(
        "https://hidayahsmart.solutions/prayer-times/hadith.php",
      ),
    )
        .timeout(const Duration(seconds: 10));   /// 🔥 TV SAFE TIMEOUT

    if (response.statusCode == 200) {

      final decoded = jsonDecode(response.body);

      return decoded['hadiths']['data'];

    } else {
      throw Exception("Failed to load hadith");
    }
  }
}
