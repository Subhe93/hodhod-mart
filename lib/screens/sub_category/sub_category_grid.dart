import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/screens/child_sub_category/child_sub_category.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_card.dart';

class SubCategoryChildGrid extends StatefulWidget {
  final int subCategoryID;

  SubCategoryChildGrid({this.subCategoryID});

  @override
  _SubCategoryChildGridState createState() => _SubCategoryChildGridState();
}

class _SubCategoryChildGridState extends State<SubCategoryChildGrid> {
  List<SubCategory> subCategories = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    HttpServices.getSubCategoriesById(widget.subCategoryID).then((value) => {
          setState(() => {subCategories = value, isLoading = false})
        });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                    category: subCategories[index],
                  ),
                ),
              ),
              itemCount: subCategories.length,
            ),
          );
  }
}
