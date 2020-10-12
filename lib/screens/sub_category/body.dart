import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/ads.dart';
import 'package:hodhod_mart/screens/sub_category/sub_categories.dart';
import 'package:hodhod_mart/screens/sub_category_childs/sub_category_child.dart';

class SubCategoryBody extends StatefulWidget {
  final List<SubCategoryRepository> subCategoryList;
  final List <SubCategoryChildRepository> children;
  final List<CollectionRepository> collectionList;

  const SubCategoryBody({Key key, this.subCategoryList , this.children , this.collectionList}) : super(key: key);

  @override
  _SubCategoryBodyState createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Ads(adHeight: 200,),
          SubCategories(subCategoryList : widget.subCategoryList,),
          SubCategoryChild(childrenArray: widget.children,collectionList: widget.collectionList,)
        ],
      ),
    );
  }
}
