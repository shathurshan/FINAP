import 'dart:convert';
import 'package:finap_test/common/api_strings.dart';
import 'package:finap_test/models/search_newsinfo.dart';
import 'package:http/http.dart' as http;

import 'package:finap_test/models/top_newsinfo.dart';

class ApiManager {
  Future<Welcome> getNews() async {
    var client = http.Client();
    var newsModel;
    http.Response response;

    try {
      response = await http.get(ApiStrings.topNewsUrl);
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      print("error1234");
    }
    return newsModel;
  }

  Future<SearchWelcome> searchNews() async {
    var client = http.Client();
    var newsModel;
    http.Response response;

    try {
      response = await http.get(ApiStrings.searchUrl);
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        newsModel = SearchWelcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return newsModel;
  }

  Future<SearchWelcome> getCategoryNews(String category) async {
    String key =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=d73b76e58c3d4e7fa311ec780cc9f4ed";

    var client = http.Client();
    var newsModel;
    http.Response response;

    try {
      response = await http.get(
        Uri.parse(key),
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        newsModel = SearchWelcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      print(Exception.toString());
    }
    return newsModel;
  }
}
