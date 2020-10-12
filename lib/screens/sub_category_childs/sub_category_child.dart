import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/sub_category_childs/sub_category_child_grid.dart';

class SubCategoryChild extends StatefulWidget {
  final List<SubCategoryChildRepository> childrenArray;
  final List<CollectionRepository> collectionList;

  const SubCategoryChild({Key key, this.childrenArray , this.collectionList}) : super(key: key);

  @override
  _SubCategoryChildState createState() => _SubCategoryChildState();
}

class _SubCategoryChildState extends State<SubCategoryChild> {
  @override
  Widget build(BuildContext context) {
    return SubCategoryChildGrid(childrenArray: widget.childrenArray,collectionList: widget.collectionList,);
  }
}
