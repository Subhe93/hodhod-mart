import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/screens/product/product_page.dart';

import '../../constants.dart';

class WishListCard extends StatefulWidget {
  WishListItem item;
  final int index;
  WishListCard({this.item, this.index});

  @override
  _WishListCardState createState() => _WishListCardState();
}

class _WishListCardState extends State<WishListCard> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            height: 110,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Slidable(
            actionPane: SlidableDrawerActionPane(),
            actions: [
              IconSlideAction(
                caption: 'Delete',
                color: signInEndColor,
                icon: Icons.delete,
                onTap: () => {
                  setState(() => {loading = true}),
                  HttpServices.deleteItemFromWishList(
                          widget.item.id, context, widget.index)
                      .then((value) => setState(() => {loading = false}))
                },
              ),
            ],
            child: Stack(
              children: [
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return ProductPage(
                      id: widget.item.productId,
                    );
                  })),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Container(
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.95,
                        color: Colors.transparent,
                        child: Card(
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0)),
                                  child: Image.network(
                                    baseUrl + widget.item.mainImage,
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.fitHeight,
                                    height: 100,
                                    width: 100,
                                  )),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                child: Text(
                                                  widget.item.name,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Transform(
                                            transform: Matrix4.identity()
                                              ..scale(0.9),
                                            child: Chip(
                                              backgroundColor: signInEndColor,
                                              label: Text(
                                                widget.item.discount == ''
                                                    ? 'No discount'
                                                    : 'Discount  ' +
                                                        widget.item.discount,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Transform(
                                            transform: Matrix4.identity()
                                              ..scale(0.9),
                                            child: Chip(
                                              backgroundColor: signInStartColor,
                                              label: Text(
                                                widget.item.offer == ''
                                                    ? 'No Offers'
                                                    : 'Offer  ' +
                                                        widget.item.offer,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          widget.item.price.toString() + " \$"),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: InkWell(
                        onTap: () => {
                              setState(() => {loading = true}),
                              HttpServices.deleteItemFromWishList(
                                      widget.item.id, context, widget.index)
                                  .then((value) =>
                                      setState(() => {loading = false}))
                            },
                        child: Icon(
                          Icons.close,
                          color: signInEndColor,
                        )))
              ],
            ),
          );
  }
}
