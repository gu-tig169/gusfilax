import 'package:http/http.dart' as http;
import 'dart:convert';

class InternetFetcher {
  static Future<String> fetchIp() async {
    http.Response response =
        await http.get("https://todoapp-api-vldfm.ondigitalocean.app/register");
    var jsonData = response.body;
    var obj = jsonDecode(jsonData);

    print(jsonData);

    return obj['ip'];
  }
}
