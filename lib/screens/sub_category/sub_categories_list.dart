import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_card.dart';


class SubCategoriesList extends StatefulWidget {
  final List<SubCategoryRepository> subCategoryList;

  const SubCategoriesList({Key key, this.subCategoryList}) : super(key: key);

  @override
  _SubCategoriesListState createState() => _SubCategoriesListState(subCategoryList);
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  final List<SubCategoryRepository> subCategoryList;

  _SubCategoriesListState(this.subCategoryList);
  @override
  Widget build(BuildContext context) {
    return ListView (
      scrollDirection: Axis.horizontal,
      children:  widget.subCategoryList.map((SubCategoryRepository value) {
        return InkWell (
          onTap: (){
          },
          child: SubCategoryCard(subCategory: value,),
        );
      }).toList(),
    );
  }
}
