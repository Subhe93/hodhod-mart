import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';

import 'child_sub_category_card.dart';

class ChildSubCategoryBody extends StatefulWidget {
  final List<CollectionCardRepository> itemsList;

  const ChildSubCategoryBody({Key key, this.itemsList}) : super(key: key);

  @override
  _ChildSubCategoryBodyState createState() => _ChildSubCategoryBodyState();
}

class _ChildSubCategoryBodyState extends State<ChildSubCategoryBody> {
  @override
  Widget build(BuildContext context) {

    return GridView.count (
      padding: EdgeInsets.only(bottom: 80),
      crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: 0.6,
        children: widget.itemsList.map((CollectionCardRepository value) {
          return ChildSubCategoryCard (item: value,);
        }).toList(),
    );
  }
}

