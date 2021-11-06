import 'package:flutter/material.dart';

import 'package:week7_gif_app/components/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Search Giphy",
      home: HomePage(),
    );
  }
}