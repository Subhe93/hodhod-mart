import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/sub_category/body.dart';

class SubCategoryPage extends StatefulWidget {
  final int catID;

  const SubCategoryPage({Key key, this.catID}) : super(key: key);

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
      ),
    );
  }
}
