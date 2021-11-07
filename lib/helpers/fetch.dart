import 'dart:convert';
import 'package:http/http.dart';

class FetchHelper {
  final String url;

  FetchHelper(this.url);

  Future<dynamic> getData() async {
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else {
      print("from inside fetch getData");
      print(response.statusCode);
    }
  }
}