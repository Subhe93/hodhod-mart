import 'package:flutter/material.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/product/components/app_bar.dart';
import 'package:hodhod_mart/screens/product/product_body.dart';

class ProductPage extends StatefulWidget {
  final CollectionCardRepository item;

  const ProductPage({Key key, this.item}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ProductBody(item: widget.item,);
  }
}
