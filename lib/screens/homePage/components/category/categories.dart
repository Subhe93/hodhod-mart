import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/screens/AllCategoriesPage/AllCategoriesPage.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_page.dart';

import 'category_card.dart';

class Categories extends StatefulWidget {
  final List<MainCategory> categories;

  Categories({
    Key key,
    this.categories,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // @override
  // void initState() {
  //   super.initState();
  //   isloading = true;
  //   // HttpServices.getCategories().then((value) => {
  //   //       Provider.of<ModelsProvider>(context, listen: false)
  //   //           .setCategories(value),
  //   //       if (mounted)
  //   //         {
  //   //           setState(() => {categories = value, isloading = false})
  //   //         }
  //   //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Applocalizations.of(context)
                        .translate("BROWSE BY CATEGORY"),
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AllCategories(
                          categories: widget.categories,
                        );
                      },
                    )),
                    child: Text(
                      Applocalizations.of(context).translate("MORE"),
                      style: TextStyle(
                        color: kTextPurpleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categories.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SubCategoryPage(
                        catID: widget.categories[index].id,
                      );
                    },
                  )),
                  child: CategoryCard(
                      category: CategoryRepository(
                          id: widget.categories[index].id,
                          image: widget.categories[index].image,
                          name: widget.categories[index].name)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
