import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/category/category_list.dart';

class Categories extends StatelessWidget {
  final List<CategoryRepository> categoriesArray ;
  final List <SubCategoryRepository> subCategoriesArray;
  final List <SubCategoryChildRepository> children;
  final List<CollectionRepository> collectionList;

  Categories({Key key, this.categoriesArray , this.subCategoriesArray , this.children , this.collectionList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 30.0 ),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text (
                      'BROWSE BY CATEGORY',
                  style: TextStyle (
                    color: kTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
                  InkWell (
                    child: Text (
                        'MORE',
                    style: TextStyle (
                      color: kTextPurpleColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),),
                  )
                ],
              ),
            ),
            CategoriesList(categoriesArray: categoriesArray,
              subCategoryList: subCategoriesArray,
              children: children , collectionList: collectionList,),
          ],
        ),
      ),
    );
  }
}
