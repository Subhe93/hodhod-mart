import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/MainCategory.dart';

import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/components/category/categories.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_page.dart';

import '../../constants.dart';

class AllCategories extends StatefulWidget {
  final List<MainCategory> categories;

  const AllCategories({Key key, this.categories}) : super(key: key);
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(
            true, false, context, true, 'Sub Categories', searchAction()),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.6),
            itemBuilder: (_, index) => MainCategoryGridCard(
              category: widget.categories[index],
            ),
            itemCount: widget.categories.length,
          ),
        ));
  }
}

class MainCategoryGridCard extends StatelessWidget {
  final MainCategory category;
  const MainCategoryGridCard({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return SubCategoryPage(
            catID: category.id,
          );
        },
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          child: Stack(
            children: [
              Image.network(
                baseUrl + category.image,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.fill,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              Center(
                child: Text(
                  category.name,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
