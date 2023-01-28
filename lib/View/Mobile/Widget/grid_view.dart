import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
int index ;
  CategoryGridView({super.key,
   required this.category,
   required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: category.categoryBackGround,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(category.categoryImage),
          Text(category.categoryTitle,
          style: GoogleFonts.exo(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),),
        ],
      ),
    );
  }
}

class Category {
  String categoryID;
  String categoryTitle;
  String categoryImage;
  Color categoryBackGround;

  Category(
      {required this.categoryID,
      required this.categoryTitle,
      required this.categoryImage,
      required this.categoryBackGround});
}
