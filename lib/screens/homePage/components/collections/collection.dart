import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/MainCategory.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection_list.dart';
import 'package:hodhod_mart/screens/sub_category/sub_category_page.dart';

class Collection extends StatelessWidget {
  final List<Product> products;
  final MainCategory category;

  const Collection({Key key, this.products, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 5),
      child: Container(
        height: 400,
        color: Colors.blue[50],
        width: MediaQuery.of(context).size.width,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SubCategoryPage(
                          catID: category.id,
                        );
                      },
                    )),
                    child: Text(
                      'MORE',
                      style: TextStyle(
                        fontFamily: 'Anago',
                        color: kTextPurpleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CollectionList(
              products: products,
            ),
          ],
        ),
      ),
    );
  }
}
