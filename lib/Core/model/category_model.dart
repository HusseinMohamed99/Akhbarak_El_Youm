import 'package:flutter/material.dart';

class CategoryModel {
  String categoryID;
  String categoryTitle;
  String categoryImage;
  Color categoryBackGround;

  CategoryModel(
      {required this.categoryID,
        required this.categoryTitle,
        required this.categoryImage,
        required this.categoryBackGround});
}