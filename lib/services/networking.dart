import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    String apiUrl = url;
    try {
      http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // print(response.body);
        var data = response.body;
        return data;
        // double tempeture = jsonDecode(data)['main']['temp'];
        // int condition = jsonDecode(data)['weather'][0]['id'];
        // String cityName = jsonDecode(data)['name'];
        // print(cityName);
        // print(condition);
        // print(tempeture);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
}
