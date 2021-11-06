import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class FetchHelper {
  final String url;

  FetchHelper(this.url);

  Future<dynamic> getData() async {
    debugPrint("from fetch getData");
    debugPrint(url);
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