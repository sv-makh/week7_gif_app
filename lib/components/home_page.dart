import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:week7_gif_app/components/gifs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _gifUrl = "";
  GifsFetch _gifsFetch = new GifsFetch();
  String defaultGif = "https://media0.giphy.com/media/xc0Sj21uaOo3Dvbb5n/giphy.gif?cid=ecf05e47qbzfc1sf5pcpgg3inba02oti9zxxmczviiz2h08z&rid=giphy.gif&ct=g";

  void updateData(gifData) {
    setState(() {
      if (gifData != null) {
        debugPrint("from home_page updateData:");
        debugPrint(jsonEncode(gifData));
        _gifUrl = gifData["data"][0]["images"]["fixed_width"]["url"].toString();
      }
      else {
        _gifUrl = defaultGif;
      }
    });
  }

  _getGifs(searchString) async {
    debugPrint("from home_page _getGifs:");
    debugPrint(searchString);
    try {
      var dataDecoded = await _gifsFetch.getGifs(searchString);
      updateData(dataDecoded);
      //setState(() {});
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(hintText: "Search Giphy"),
                onSubmitted: (String searchString) => _getGifs(searchString),
              ),
              if (_gifUrl != "") Image.network(_gifUrl)
            ],
          ),
        ),
      )
    );
  }
}