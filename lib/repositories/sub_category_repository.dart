import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';

class SubCategoryRepository {
  final String name;
  final String image;
  final List<SubCategoryChildRepository> children;
  SubCategoryRepository({this.name, this.image , this.children});
}