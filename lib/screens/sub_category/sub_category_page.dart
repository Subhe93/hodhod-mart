import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/sub_category/body.dart';

class SubCategoryPage extends StatefulWidget {
  final int catID;
  final List<MainCategory> categories;

  const SubCategoryPage({Key key, this.catID, this.categories})
      : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          homeAppBar(false, context, true, 'Sub Categories', searchAction()),
      body: SubCategoryBody(
        catID: widget.catID,
        categories: widget.categories,
      ),
    );
  }
}
