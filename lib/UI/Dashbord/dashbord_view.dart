import 'package:finap_test/UI/Dashbord/category_page.dart';
import 'package:finap_test/UI/DetailScreen/detailpage.dart';
import 'package:finap_test/models/catergory.dart';
import 'package:finap_test/provider/category_data.dart';
import 'package:finap_test/services/api_manager.dart';
import 'package:finap_test/widgets/category_card.dart';
import 'package:finap_test/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:finap_test/models/top_newsinfo.dart';

class DashbordScreen extends StatefulWidget {
  static const routeName = '/dashbordScreen';

  const DashbordScreen({Key? key}) : super(key: key);

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  bool isData = false;
  Future<Welcome>? futureWelcom;
  List<CategoryModel> catergory = <CategoryModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getNews();
    ApiManager().searchNews();
    isData = true;
    catergory = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var articles;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: ScreenUtil().setHeight(8),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            ScreenUtil().setHeight(100),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(27.05),
              left: ScreenUtil().setWidth(26.68),
              right: ScreenUtil().setWidth(26.68),
              bottom: ScreenUtil().setHeight(27.05),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                // fontFamily: manropeMedium,
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(14.0),
              ),
              decoration: InputDecoration(
                hintText: "Search",
                contentPadding: EdgeInsets.fromLTRB(
                  0,
                  ScreenUtil().setHeight(8.81),
                  ScreenUtil().setWidth(182.21),
                  ScreenUtil().setHeight(9.7),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.red,
                ),
              ),
              onChanged: (val) {
                setState(() {
                  // _quantity = val;
                });
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Headline",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                height: ScreenUtil().setHeight(170),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catergory.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Categerypage(
                                categoryName: catergory[index]
                                    .categoryName
                                    .toString()
                                    .toLowerCase(),
                              );
                            },
                          ),
                        );
                      },
                      imageUrl: catergory[index].imageUrl,
                      categoryName: catergory[index].categoryName,
                    );
                  },
                ),
              ),
              Text(
                "Top News",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              Expanded(
                child: Container(
                  child: isData
                      ? FutureBuilder<Welcome>(
                          future: ApiManager().getNews(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                              itemCount: snapshot.data?.articles.length,
                              itemBuilder: (context, index) {
                                articles = snapshot.data?.articles[index];
                                return NewsList(
                                  newsFunction: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailsPage(
                                            imageUrl: articles.urlToImage,
                                            publishedDate: articles.publishedAt,
                                            author: articles.author,
                                            title: articles.title,
                                            describtion: articles.description,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  title: articles.title,
                                  imageUrl: articles.urlToImage,
                                  describtion: articles.description,
                                );
                              },
                            );
                          },
                        )
                      : const Center(
                          child: Text("NO DATA AVAILBLE"),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
