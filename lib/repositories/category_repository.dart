import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';

class CategoryRepository {
  final String name;
  final String image;
  final List<SubCategoryRepository> subCategoriesList;

  CategoryRepository({this.name, this.image , this.subCategoriesList});
}