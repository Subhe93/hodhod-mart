import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/product/components/app_bar.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class EditOrder extends StatefulWidget {
  final CartItem item;
  final int index;

  EditOrder({
    Key key,
    this.item,
    this.index,
  }) : super(key: key);

  @override
  _EditOrderState createState() => _EditOrderState();
}

class _EditOrderState extends State<EditOrder> {
  CartItem items;
  int quantity;
  bool loading;
  List<int> options;
  ProductDetails product;
  int total;
  List<List<Attribute>> attributes;
  List<String> attributesNames;

  @override
  void initState() {
    attributes = [];
    attributesNames = [];
    loading = true;
    quantity = widget.item.quantity;
    total = 0;
    super.initState();
    options = [];
    HttpServices.getProductDetails(widget.item.productId, context)
        .then((value) => {
              if (mounted)
                {
                  setState(
                      () => {loading = false, product = value, getTotal()}),

                  ///this code to convert the dictionary to lists to be able to display them
                  if (value.attributes != null)
                    {
                      attributesNames = value.attributes.keys.toList(),
                      attributes = value.attributes.values.toList(),
                    },

                  ////
                  ///
                  ///sorry for the messy code
                  ///this loop to decode the options and set the hilight the the selected ones
                  if (widget.item.options != null)
                    {
                      for (var value in json.decode(widget.item.options))
                        {
                          for (var i = 0; i < attributes.length; i++)
                            {
                              for (var j = 0; j < attributes[i].length; j++)
                                {
                                  if (value['id'] == attributes[i][j].id)
                                    {
                                      attributes[i][j].selected = true,
                                      total =
                                          total + attributes[i][j].addToPrice
                                    }
                                }
                            }
                        }
                    }
                }
            });
  }

  @override
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              top: false,
              bottom: true,
              child: Stack(
                children: [
                  NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          backgroundColor: Colors.transparent,
                          expandedHeight: 300.0,
                          centerTitle: true,
                          floating: true,
                          pinned: true,
                          flexibleSpace: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              // print('constraints=' + constraints.toString());
                              top = constraints.biggest.height;
                              return Container(
                                child: FlexibleSpaceBar(
                                  centerTitle: true,
                                  title: top == 100
                                      ? Text(
                                          'product.name',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(''),
                                  titlePadding: EdgeInsets.only(
                                      left: 60, right: 30, bottom: 15),
                                  background: Stack(
                                    children: [
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl:
                                                baseUrl + widget.item.mainImage,
                                            placeholder: (context, url) =>
                                                Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: LoadingIndicator(
                                                    indicatorType:
                                                        Indicator.ballScale,
                                                    color: signInStartColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          )
                                          // Image.network(
                                          //   baseUrl + widget.item.mainImage,
                                          //   fit: BoxFit.fitWidth,
                                          // ),
                                          ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ];
                    },
                    body: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      widget.item.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.item.price.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            widget.item.price.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      RatingBar(
                                        itemCount: 5,
                                        initialRating: 3,
                                        itemSize: 15,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Options :',
                                        style: TextStyle(
                                            color: signInStartColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.share),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            attributes.length == 0
                                ? Container(
                                    height: 20,
                                    child: Center(
                                      child: Text('No Options for this item'),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 8),
                                    child: Container(
                                      height:
                                          180 * attributes.length.toDouble(),
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        itemCount: attributes.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            AttributeCollection(
                                          attributes[index],
                                          attributesNames[index],
                                          index,
                                        ),
                                      ),
                                    ),
                                  ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 10,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: SizedBox(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5.0, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Return Policy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Get it in ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: "5 - 6 days ",
                                          style:
                                              TextStyle(color: instaTextColor),
                                        ),
                                        TextSpan(
                                          text:
                                              "Enter your pinched for accurate delivery details.",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 'Choose to return or exchange for different size available within ' + '',
                                  // maxLines: 10,
                                  // style: TextStyle (
                                  //     fontSize: 15,
                                  //     color: kTextColor,
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 10,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5.0, top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Product Features',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Get it in ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: "5 - 6 days ",
                                          style:
                                              TextStyle(color: instaTextColor),
                                        ),
                                        TextSpan(
                                          text:
                                              "Enter your pinched for accurate delivery details.",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Quantity",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: signInStartColor,
                                                  fontWeight: FontWeight.bold)),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () => {
                                                  setState(() => {
                                                        quantity = quantity + 1,
                                                      }),
                                                  getTotal()
                                                },
                                                child: Icon(
                                                  Icons
                                                      .add_circle_outline_sharp,
                                                  color: Colors.black87,
                                                  size: 32,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                quantity.toString(),
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () => {
                                                  setState(() => {
                                                        if (quantity >= 1)
                                                          {
                                                            quantity =
                                                                quantity - 1
                                                          },
                                                      }),
                                                  getTotal()
                                                },
                                                child: Icon(
                                                  Icons
                                                      .remove_circle_outline_sharp,
                                                  color: Colors.black87,
                                                  size: 32,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Container(
                                  //   height: 70,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //                 Applocalizations.of(context)
                                  //                     .translate("Total"),
                                  //                 style: TextStyle(
                                  //                     fontSize: 20,
                                  //                     color: signInStartColor,
                                  //                     fontWeight:
                                  //                         FontWeight.bold)),
                                  //             // SizedBox(height: 10),
                                  //             // Provider.of<ModelsProvider>(
                                  //             //             context,
                                  //             //             listen: false)
                                  //             //         .cuoponApplyed
                                  //             //     ? Text(
                                  //             //         'Coupon Applyed',
                                  //             //         style: TextStyle(
                                  //             //             color:
                                  //             //                 signInStartColor),
                                  //             //       )
                                  //             //     : Text('No Coupon Applyed',
                                  //             //         style: TextStyle(
                                  //             //             color:
                                  //             //                 signInStartColor))
                                  //           ],
                                  //         ),
                                  //         Text(widget.item.price.toString(),
                                  //             style: TextStyle(
                                  //                 fontSize: 20,
                                  //                 color: signInEndColor,
                                  //                 fontWeight: FontWeight.bold))
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                            Center(
                              child: InkWell(
                                onTap: () =>
                                    {showDeleteAlert(widget.item.id, context)},
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  color: Colors.red,
                                  child: Center(
                                      child: Text(
                                    'Remove From Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  productAppBar(context, widget.item.productId),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () => {
                        setState(() => loading = true),
                        for (var i = 0; i < attributes.length; i++)
                          {
                            for (var sub in attributes[i])
                              {
                                if (sub.selected) {options.add(sub.id)}
                              }
                          },
                        HttpServices.updateCartItem(
                          widget.item.id,
                          widget.item.productId,
                          quantity,
                          context,
                          options.toString(),
                        ).then((value) => {setState(() => loading = false)})
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text(
                          'Update Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /////
  ///
  ///
  ///
  /// Calculating Total
  void getTotal() {
    if (quantity != 0) {
      total = product.price;
      for (var attributeType in attributes) {
        for (var subattribute in attributeType) {
          if (subattribute.selected) {
            total = total + subattribute.addToPrice;
          }
        }
      }
      total = total * quantity;
    } else {
      setState(() {
        total = 0;
      });
    }
  }

  showDeleteAlert(int id, BuildContext dialogContext) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Remove"),
      onPressed: () {
        Navigator.pop(context);
        setState(() => {loading = true});
        HttpServices.deleteItemFromCart(id, context).then((value) => {
              if (value) {Navigator.pop(context)}
            });
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure you want to remove product"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget AttributeCard(Attribute attribute, int collectionIndex) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {
          for (int i = 0; i < attributes[collectionIndex].length; i++)
            {attributes[collectionIndex][i].selected = false},
          setState(() => {
                attribute.selected
                    ? attribute.selected = false
                    : attribute.selected = true,
                getTotal()
              })
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(
                  width: attribute.selected ? 2 : 0.5,
                  color: attribute.selected ? signInStartColor : Colors.grey)),
          child: Column(
            children: [
              Text(
                attribute.value,
                style: TextStyle(color: signInStartColor, fontSize: 16),
              ),
              Expanded(
                child: Image.network(
                  baseUrl + attribute.image,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget AttributeCollection(
      List<Attribute> attributesCollection, String title, int collectionIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
          child: Container(
            height: 20,
            child: Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: attributesCollection.length,
            itemBuilder: (context, index) =>
                AttributeCard(attributesCollection[index], collectionIndex),
          ),
        ),
      ],
    );
  }
}
