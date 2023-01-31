import 'dart:convert';
import 'package:akhbarak_el_youm/Core/model/news_response.dart';
import 'package:akhbarak_el_youm/Core/model/sources_response.dart';
import 'package:http/http.dart' as http;

class ApisManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '47fdf73cd1fe407da9640d540c1366c3';



  static Future<SourcesResponse> getSources(String categoryID) async {

    //  https://newsapi.org/v2/top-headlines/sources?apiKey=0803a9972d064bd8b3b7379123ea164c&category=sports
    //  /v2/top-headlines/sources?
    //  apiKey=0803a9972d064bd8b3b7379123ea164c&category=sports

    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryID,

    });
    var response = await http.get(url);

    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceID, String? query})async
  {
    // https://newsapi.org/v2/everything?sources=business-insider&apiKey=0803a9972d064bd8b3b7379123ea164c

    var url = Uri.https(baseUrl, '/v2/everything', {
      'apiKey': apiKey,
      'sources': sourceID,
      'q': query,
          });
    var response = await http.get(url);

    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
