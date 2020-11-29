import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/model/ResponsModels/searchResponse.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';
import 'package:hodhod_mart/screens/search/searchResults/searchResultItem.dart';

class SearchResults extends StatefulWidget {
  final SearchResponse searchResults;

  const SearchResults({Key key, this.searchResults}) : super(key: key);
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int currentPage;
  int pageCount;
  List<Product> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = 1;
    items = widget.searchResults.products.data;
    pageCount = (widget.searchResults.products.total /
            widget.searchResults.products.perPage)
        .round();
    if (pageCount == 0) {
      pageCount = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
          false, false, context, false, 'HODHOD MART', searchAction()),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_left_rounded,
                color: signInEndColor,
                size: 50,
              ),
              Text(
                'Page $currentPage Of $pageCount',
                style: TextStyle(fontSize: 17, color: signInStartColor),
              ),
              Icon(
                Icons.arrow_right_rounded,
                color: signInEndColor,
                size: 50,
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductPage(
                              id: items[index].id,
                            );
                          },
                        ),
                      ),
                      child: SearchResultItem(
                        item: items[index],
                      ),
                    )),
          ),
        ],
      )),
    );
  }
}
