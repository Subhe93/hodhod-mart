import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';

import 'package:hodhod_mart/screens/homePage/components/category/category_card.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_grid.dart';
import 'package:hodhod_mart/widgets/static_banners.dart';

class SubCategoryBody extends StatefulWidget {
  final int catID;
  final List<MainCategory> categories;

  const SubCategoryBody({
    Key key,
    this.catID,
    this.categories,
  }) : super(key: key);

  @override
  _SubCategoryBodyState createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
  var selectedCatID = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StaticBanners(),
          Column(
            children: [
              Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.categories.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => setState(() {
                          selectedCatID = widget.categories[index].id;
                          print(selectedCatID);
                        }),
                        child: CategoryCard(
                            category: CategoryRepository(
                                id: widget.categories[index].id,
                                image: widget.categories[index].image,
                                name: widget.categories[index].name)),
                      ),
                    ),
                  )),
            ],
          ),
          SubCategoryChildGrid(
            subCategoryID: (selectedCatID == 0) ? widget.catID : selectedCatID,
          ),
        ],
      ),
    );
  }
}
