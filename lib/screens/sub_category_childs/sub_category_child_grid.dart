import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/repositories/sub_category_child_repository.dart';
import 'package:hodhod_mart/screens/child_sub_category/child_sub_category.dart';
import 'package:hodhod_mart/screens/sub_category_childs/sub_category_child_card.dart';


class SubCategoryChildGrid extends StatefulWidget {
  final List<SubCategoryChildRepository> childrenArray;
  final List<CollectionRepository> collectionList;

  const SubCategoryChildGrid({Key key, this.childrenArray , this.collectionList}) : super(key: key);

  @override
  _SubCategoryChildGridState createState() => _SubCategoryChildGridState();
}

class _SubCategoryChildGridState extends State<SubCategoryChildGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count (
        padding: EdgeInsets.all(10),
        primary: false,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: widget.childrenArray.map((SubCategoryChildRepository value) {
          return InkWell (
            onTap:  (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChildSubCategory(itemsList: widget.collectionList[0].collectionList,);
              }));
            },
            child: SubCategoryChildCard(child: value,),
          );
        }).toList(),
      ),
    );
  }
}
