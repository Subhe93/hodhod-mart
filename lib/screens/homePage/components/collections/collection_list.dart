import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection_card.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';

class CollectionList extends StatefulWidget {
  final List<CollectionCardRepository> collectionList;

  const CollectionList({Key key, this.collectionList}) : super(key: key);

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProductPage(
                // product: widget.collectionList[0],
                );
          }),
        );
      },
      child: Container(
        height: 350,
        color: Colors.blue[50],
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widget.collectionList.map((CollectionCardRepository value) {
            return CollectionCard(
              collectionCardItem: value,
            );
          }).toList(),
        ),
      ),
    );
  }
}
