import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatefulWidget {
  final String imageUrl;
  final String categoryName;
  final VoidCallback function;
  const CategoryCard({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
    required this.function,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        margin: EdgeInsets.only(
          right: ScreenUtil().setHeight(12),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imageUrl,
                width: ScreenUtil().setHeight(245),
                height: ScreenUtil().setWidth(140),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(60),
              width: ScreenUtil().setWidth(150),
              alignment: Alignment.center,
              child: Text(
                widget.categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
