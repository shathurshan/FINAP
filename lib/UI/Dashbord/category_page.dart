import 'package:finap_test/models/search_newsinfo.dart';
import 'package:finap_test/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/news_list.dart';
import '../DetailScreen/detailpage.dart';

class Categerypage extends StatefulWidget {
  static const routeName = '/categoryScreen';
  final String categoryName;
  const Categerypage({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<Categerypage> createState() => _CategerypageState();
}

class _CategerypageState extends State<Categerypage> {
  Future<SearchWelcome>? futureSearchWelcom;
  bool isCategoryData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getCategoryNews(widget.categoryName);
    isCategoryData = true;
  }

  @override
  Widget build(BuildContext context) {
    var searchArticle;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
        ),
      ),
      body: !isCategoryData
          ? const Center(
              child: Text("NO DATA AVAILBLE"),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(20),
                left: ScreenUtil().setWidth(20),
                right: ScreenUtil().setWidth(20),
              ),
              child: FutureBuilder<SearchWelcome>(
                future: ApiManager().getCategoryNews(widget.categoryName),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data?.articles.length,
                    itemBuilder: (context, index) {
                      searchArticle = snapshot.data?.articles[index];
                      return NewsList(
                        newsFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsPage(
                                  imageUrl: searchArticle.urlToImage,
                                  publishedDate: searchArticle.publishedAt,
                                  author: searchArticle.author,
                                  title: searchArticle.title,
                                  describtion: searchArticle.description,
                                );
                              },
                            ),
                          );
                        },
                        title: searchArticle.title,
                        imageUrl: searchArticle.urlToImage,
                        describtion: searchArticle.description,
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
