import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsList extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String describtion;
  final VoidCallback newsFunction;
  const NewsList({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.describtion,
    required this.newsFunction,
  }) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.newsFunction,
      child: Container(
        padding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(15),
        ),
        margin: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: Colors.grey,
            width: 0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 9,
              offset: const Offset(
                3,
                3,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(5),
                bottom: ScreenUtil().setHeight(5),
                right: ScreenUtil().setWidth(5),
                left: ScreenUtil().setWidth(5),
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth(5),
                left: ScreenUtil().setWidth(5),
              ),
              child: Text(
                widget.describtion,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
