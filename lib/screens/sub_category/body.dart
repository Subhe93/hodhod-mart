import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/model/ResponsModels/Startup.dart';
import 'package:hodhod_mart/model/SubCategory.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/ads.dart';

import 'package:hodhod_mart/screens/homePage/components/category/category_card.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_grid.dart';
import 'package:hodhod_mart/widgets/static_banners.dart';
import 'package:provider/provider.dart';

class SubCategoryBody extends StatefulWidget {
  final int catID;

  const SubCategoryBody({
    Key key,
    this.catID,
  }) : super(key: key);

  @override
  _SubCategoryBodyState createState() => _SubCategoryBodyState();
}

class _SubCategoryBodyState extends State<SubCategoryBody> {
  var selectedCatID = 0;
  List<SubCategory> subCategories;
  bool loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading = true;
    HttpServices.getSubCategoriesById(widget.catID).then((value) => {
          if (mounted)
            {
              setState(() => {subCategories = value, loading = false})
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    List<MainCategory> categories =
        Provider.of<ModelsProvider>(context, listen: false).categories;

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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => {
                        setState(() {
                          selectedCatID = categories[index].id;
                          loading = true;
                        }),
                        HttpServices.getSubCategoriesById(selectedCatID)
                            .then((value) => {
                                  if (mounted)
                                    {
                                      setState(() => {
                                            subCategories = value,
                                            loading = false
                                          })
                                    }
                                })
                      },
                      child: CategoryCard(
                          category: CategoryRepository(
                              id: categories[index].id,
                              image: categories[index].image,
                              name: categories[index].name)),
                    ),
                  )),
            ],
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SubCategoryChildGrid(
                  subCategoryID:
                      (selectedCatID == 0) ? widget.catID : selectedCatID,
                  subCategories: subCategories,
                ),
        ],
      ),
    );
  }
}
