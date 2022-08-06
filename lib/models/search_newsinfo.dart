
import 'dart:convert';

SearchWelcome searchWelcomeFromJson(String str) =>
    SearchWelcome.fromJson(json.decode(str));

String searchWelcomeToJson(SearchWelcome data) => json.encode(data.toJson());

class SearchWelcome {
  SearchWelcome({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<SearchArticle> articles;

  factory SearchWelcome.fromJson(Map<String, dynamic> json) => SearchWelcome(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<SearchArticle>.from(
            json["articles"].map((x) => SearchArticle.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class SearchArticle {
  SearchArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  SearchSource source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory SearchArticle.fromJson(Map<String, dynamic> json) => SearchArticle(
        source: SearchSource.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class SearchSource {
  String id;
  String name;

  SearchSource({
    required this.id,
    required this.name,
  });

  factory SearchSource.fromJson(Map<String, dynamic> json) => SearchSource(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
