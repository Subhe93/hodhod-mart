import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_page.dart';
import 'package:provider/provider.dart';

import 'category_card.dart';

class Categories extends StatefulWidget {
  Categories({
    Key key,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<MainCategory> categories = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    HttpServices.getCategories().then(
        (value) => setState(() => {categories = value, isloading = false}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        height: 120,
        color: Colors.blue[50],
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
                    'BROWSE BY CATEGORY',
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      'MORE',
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
            isloading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SubCategoryPage(
                              catID: categories[index].id,
                              categories: categories,
                            );
                          },
                        )),
                        child: CategoryCard(
                            category: CategoryRepository(
                                id: categories[index].id,
                                image: categories[index].image,
                                name: categories[index].name)),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
