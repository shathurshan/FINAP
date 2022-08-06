class ApiStrings {
  static const String myApiKey = "d73b76e58c3d4e7fa311ec780cc9f4ed";
  static const String topNewsApiKey =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$myApiKey";
  static const String searchNewsApiKey =
      "https://newsapi.org/v2/everything?q=Apple&from=2022-08-05&sortBy=popularity&apiKey=$myApiKey";

  static var searchUrl = Uri.parse(searchNewsApiKey);
  static var topNewsUrl = Uri.parse(topNewsApiKey);
}
