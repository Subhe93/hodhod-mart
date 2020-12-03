import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/model/ResponsModels/searchResponse.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';
import 'package:hodhod_mart/screens/search/searchResults/searchResultItem.dart';

class SearchResults extends StatefulWidget {
  final SearchResponse searchResults;
  final String searchKeyWord;
  final int catID;
  const SearchResults(
      {Key key, this.searchResults, this.searchKeyWord, this.catID})
      : super(key: key);
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  int currentPage;
  int pageCount;
  List<Product> items;
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = false;
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
          false, false, context, false, 'HODHOD MART', searchAction(context)),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              currentPage == 1
                  ? Container(
                      width: 50,
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          currentPage = currentPage - 1;
                          loading = true;
                        });
                        HttpServices.search(
                                widget.searchKeyWord,
                                widget.catID.toString(),
                                currentPage.toString(),
                                context)
                            .then((value) => {
                                  setState(() {
                                    loading = false;
                                    items = value.products.data;
                                  })
                                });
                      },
                      child: Icon(
                        Icons.arrow_left_rounded,
                        color: signInEndColor,
                        size: 50,
                      ),
                    ),
              Text(
                'Page $currentPage Of $pageCount',
                style: TextStyle(fontSize: 17, color: signInStartColor),
              ),
              currentPage == pageCount
                  ? Container(
                      width: 50,
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          currentPage = currentPage + 1;
                          loading = true;
                        });
                        HttpServices.search(
                                widget.searchKeyWord,
                                widget.catID.toString(),
                                currentPage.toString(),
                                context)
                            .then((value) => {
                                  setState(() {
                                    loading = false;
                                    items = value.products.data;
                                  })
                                });
                      },
                      child: Icon(
                        Icons.arrow_right_rounded,
                        color: signInEndColor,
                        size: 50,
                      ),
                    )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 150,
            child: loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
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
