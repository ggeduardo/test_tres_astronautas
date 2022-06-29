import 'package:http/http.dart' as http;

class DataRepository {
  String encondePath = '/v1/gifs/search';
  String urlRoot = "api.giphy.com";
  String apiKey = "2XSFGBbeR4XZ9tDiiwfmI2phDjG8M6mY";
  Map<String, String> headers = {'Content-Type': 'application/json'};
  Future<http.Response> getData() async {
    final url = Uri.https(urlRoot, encondePath, {
      "api_key": apiKey,
      "q": "restaurant",
      "limit": "10",
    });
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}
