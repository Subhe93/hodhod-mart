import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/screens/child_sub_category/sub_category_page.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_card.dart';

class SubCategoryChildGrid extends StatefulWidget {
  final int subCategoryID;
  final List<SubCategory> subCategories;

  SubCategoryChildGrid({this.subCategoryID, this.subCategories});

  @override
  _SubCategoryChildGridState createState() => _SubCategoryChildGridState();
}

class _SubCategoryChildGridState extends State<SubCategoryChildGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ChildSubCategory(
                subCatId: widget.subCategoryID,
              );
            },
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubCategoryChildCard(
              category: widget.subCategories[index],
            ),
          ),
        ),
        itemCount: widget.subCategories.length,
      ),
    );
  }
}
