import 'dart:convert';
import 'package:http/http.dart';
import 'package:qoloni/src/features/news/data/api/api_constants.dart';
import 'package:qoloni/src/features/news/domain/models/story_model.dart';

class NewsRepo {
  String endPoint = 'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=${ApiConstants.newsApiKey}';

  Future<List<StoryModel>> getTopNews() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map((e) => StoryModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

}
