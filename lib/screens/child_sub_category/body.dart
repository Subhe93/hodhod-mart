import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';

import 'sub_category_Item_card.dart';

class ChildSubCategoryBody extends StatefulWidget {
  final int subCatID;

  const ChildSubCategoryBody({Key key, this.subCatID}) : super(key: key);

  @override
  _ChildSubCategoryBodyState createState() => _ChildSubCategoryBodyState();
}

class _ChildSubCategoryBodyState extends State<ChildSubCategoryBody> {
  List<Product> products;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    HttpServices.getSubCategoryProducts(widget.subCatID).then((value) => {
          if (mounted)
            {
              setState(() => {products = value, isloading = false})
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Center(child: CircularProgressIndicator())
        : products.isEmpty
            ? Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'No Products To Show',
                    style: TextStyle(color: signInStartColor, fontSize: 20),
                  ),
                ))
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.6),
                  itemBuilder: (_, index) => SubCategoryItemCard(
                    item: products[index],
                  ),
                  itemCount: products.length,
                ),
              );
  }
}
