import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/sub_category/body.dart';

class SubCategoryPage extends StatefulWidget {
  final List<SubCategoryRepository> subCategoryList;
  final List<SubCategoryChildRepository> children;
  final List<CollectionRepository> collectionList;

  const SubCategoryPage({Key key, this.subCategoryList , this.children , this.collectionList}) : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(false , context, true , 'Sub Categories' , searchAction()),
      body: SubCategoryBody(subCategoryList: widget.subCategoryList,children: widget.children,collectionList: widget.collectionList,),
    );
  }
}
