import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/category_repository.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/category/category_card.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category.dart';


class CategoriesList extends StatefulWidget {
  final List <CategoryRepository> categoriesArray ;
  final List<SubCategoryRepository> subCategoryList;
  final List <SubCategoryChildRepository> children;
  final List<CollectionRepository> collectionList;

  const CategoriesList({Key key, this.categoriesArray , this.subCategoryList , this.children , this.collectionList}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView (
        scrollDirection: Axis.horizontal,
        children:  widget.categoriesArray.map((CategoryRepository value) {
          return InkWell (
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SubCategoryPage(subCategoryList: value.subCategoriesList,
                    children: widget.children , collectionList: widget.collectionList,);
                  },
                ),
              );
            },
            child: CategoryCard(category: value,),
          );
        }).toList(),
      ),
    );
  }
}
