import 'dart:convert';

import 'package:flutter_application_1/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  //final endPointUrl = 'https://newsapi.org/v2/everything?q=apple&from=2022-04-26&to=2022-04-26&sortBy=popularity&apiKey=57417a410b194f2196e340c7beea4880';

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'domains' : 'wsj.com',
      'apiKey': '57417a410b194f2196e340c7beea4880'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
