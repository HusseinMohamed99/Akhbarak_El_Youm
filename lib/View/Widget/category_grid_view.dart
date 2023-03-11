import 'package:akhbarak_el_youm/Core/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryGridView extends StatelessWidget {
  final CategoryModel category;
  final int index;
  final Function onClickItem;

  const CategoryGridView({
    super.key,
    required this.category,
    required this.index,
    required this.onClickItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickItem(category);
        if (kDebugMode) {
          print(category.categoryID);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(12).r,
        decoration: BoxDecoration(
            color: category.categoryBackGround,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
            ).r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.categoryImage,
            ),
            Text(
              category.categoryTitle,
              style: GoogleFonts.exo(
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
