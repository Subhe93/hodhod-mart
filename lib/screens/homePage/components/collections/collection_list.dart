import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection_card.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';

class CollectionList extends StatefulWidget {
  final List<Product> products;
  const CollectionList({Key key, this.products}) : super(key: key);

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      // color: Colors.blue[50],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.products.map((Product value) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ProductPage(
                  id: value.id,
                );
              }),
            ),
            child: CollectionCard(
              product: value,
            ),
          );
        }).toList(),
      ),
    );
  }
}
