import 'package:flutter_application_1/model/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article(
      {required this.source,
      this.author = "",
      this.title = "",
      this.description = "",
      this.url = "",
      this.urlToImage = "",
      this.publishedAt = "",
      this.content = ""});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] == null ? "No author" : json['author'],
      title: json['title'] == null ? "No title" : json['title'],
      description: json['description'] == null ? "No description" : json['description'],
      url: json['url'] == null ? "No article url" : json['url'],
      urlToImage: json['urlToImage'] == null ? "No image" : json['urlToImage'],
      publishedAt: json['publishedAt'] == null ? "No publishing date" : json['publishedAt'],
      content: json['content'] == null ? "No content" : json['content'],
    );
  }
}
