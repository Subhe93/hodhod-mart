import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/homePage/components/ads.dart';
import 'package:hodhod_mart/screens/homePage/components/category/categories.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    List<MainCategory> categoriesToShow =
        Provider.of<ModelsProvider>(context, listen: true).categoriesToShow;

    return SingleChildScrollView(
      child: Container(
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Ads(
              banners:
                  Provider.of<ModelsProvider>(context, listen: false).banners,
              adHeight: 200,
            ),
            Container(
              child: Categories(
                categories: Provider.of<ModelsProvider>(context, listen: false)
                    .categories,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 420 * categoriesToShow.length.toDouble(),
              color: Colors.blue[50],
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: Provider.of<ModelsProvider>(context, listen: true)
                    .categoriesToShow
                    .length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Collection(
                    products: Provider.of<ModelsProvider>(context, listen: true)
                        .homeProducts[index],
                    category: categoriesToShow[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
