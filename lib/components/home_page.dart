import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:week7_gif_app/components/gifs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gifsUrl = <String>[];
  GifsFetch _gifsFetch = new GifsFetch();
  String defaultGif = "https://media3.giphy.com/media/d2W7eZX5z62ziqdi/200w.gif";

  void updateData(gifData) {
    setState(() {
      if (gifData != null) {
        debugPrint("from home_page updateData:");
        debugPrint(jsonEncode(gifData));
        for (int i = 0; i < 8; i++) {
          _gifsUrl.add(gifData["data"][i]["images"]["fixed_width"]["url"].toString());
        }
      }
      else {
        for (int i = 0; i < 8; i++) {
          _gifsUrl.add(defaultGif);
        }
      }
    });
  }

  _getGifs(searchString) async {
    debugPrint("from home_page _getGifs:");
    debugPrint(searchString);
    try {
      var dataDecoded = await _gifsFetch.getGifs(searchString);
      updateData(dataDecoded);
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
              if (_gifsUrl != null)
                Container(
                  padding: EdgeInsets.all(5),
                  height: 600,
                  child:
                    ListView.builder(
                      itemCount: _gifsUrl.length~/2,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Row(
                            children: [
                              Image.network(_gifsUrl[index*2], width: 185,),
                              Image.network(_gifsUrl[index*2+1], width: 185,),
                            ]);
                    })
                )
            ],
          ),
        ),
      )
    );
  }
}