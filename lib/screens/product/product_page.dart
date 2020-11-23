import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/screens/product/product_body.dart';

class ProductPage extends StatefulWidget {
  final int id;

  const ProductPage({
    Key key,
    this.id,
  }) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ProductBody(
      id: widget.id,
    );
  }
}
