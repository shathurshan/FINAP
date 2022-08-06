import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final String imageUrl;
  final DateTime publishedDate;
  final String title;
  final String author;
  final String describtion;

  const DetailsPage({
    Key? key,
    required this.imageUrl,
    required this.publishedDate,
    required this.author,
    required this.title,
    required this.describtion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fromateDate = DateFormat('EEEE,d MMM, yyyy').format(publishedDate);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Stack(
            children: [
              ClipRRect(
                child: Image.network(
                  imageUrl,
                  height: ScreenUtil().setHeight(400),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 470,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: ScreenUtil().setWidth(100),
                          left: ScreenUtil().setWidth(16),
                          right: ScreenUtil().setWidth(16),
                        ),
                        child: Text(
                          describtion,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 370,
                left: 40,
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                    ),
                    height: ScreenUtil().setHeight(141),
                    width: ScreenUtil().setWidth(311),
                    child: Padding(
                      padding: EdgeInsets.all(
                        ScreenUtil().setHeight(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            fromateDate.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Published by $author",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(10),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
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
