import 'package:week7_gif_app/helpers/fetch.dart';
import 'package:week7_gif_app/helpers/constants.dart';

const giphyUrl = "https://api.giphy.com/v1/gifs/search";

class GifsFetch {
  Future<dynamic> getGifs(String searchString) async {
    FetchHelper fetchData = new FetchHelper(
        "$giphyUrl?api_key=$giphyApiKey&q=$searchString&limit=1&offset=0&rating=g&lang=en");

    var decodedData = await fetchData.getData();
    return decodedData;
  }
}