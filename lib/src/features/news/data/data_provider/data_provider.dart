import 'dart:convert';
import 'package:http/http.dart' as http;
import './../api/api_constants.dart';
import '../../domain/models/article_model.dart';

class DataProvider {
  final endPointUrl = "newsapi.org";
  final unencodedPath = "/v2/top-headlines";
  final client = http.Client();

  Future<List<Article>?> getArticles(String categoryName, String country) async {
    Map<String, String> queryParameters = {'country': country};

    if (categoryName[1] != 'o') {
      queryParameters['category'] = categoryName;
    }
    queryParameters['newsApiKey'] = ApiConstants.newsApiKey;
    try {
      final uri = Uri.https(endPointUrl, unencodedPath, queryParameters);
      final response = await client.get(uri);
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article>? articles = [];
      articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } catch (e) {
      throw ("Can't access the articles!");
    }
  }
}

