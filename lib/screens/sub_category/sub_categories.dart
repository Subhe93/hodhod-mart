import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/sub_category/sub_categories_list.dart';

class SubCategories extends StatelessWidget {
  final List<SubCategoryRepository> subCategoryList;

  const SubCategories({Key key, this.subCategoryList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: SubCategoriesList(subCategoryList: subCategoryList,),
    );
  }
}
