import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/Cart.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/product/components/app_bar.dart';
import 'package:provider/provider.dart';

class EditOrder extends StatefulWidget {
  final CartItem item;
  final int index;
  List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];

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
  // List<List<Attribute>> attributes;
  // List<String> attributesNames;
  @override
  void initState() {
    loading = false;
    quantity = widget.item.quantity;
    // added = false;
    // attributes = [];
    // attributesNames = [];
    super.initState();
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
                                        child: Image.network(
                                          baseUrl + widget.item.mainImage,
                                          fit: BoxFit.fitWidth,
                                        ),
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
                                  // Container(
                                  //   width: MediaQuery.of(context).size.width,
                                  //   height: 25,
                                  //   child: ListView(
                                  //     scrollDirection: Axis.horizontal,
                                  //     children: [
                                  //       Padding(
                                  //         padding: const EdgeInsets.all(5.0),
                                  //         child: Container(
                                  //           width: 15,
                                  //           height: 15,
                                  //           color: Colors.black,
                                  //         ),
                                  //       ),
                                  //       Padding(
                                  //         padding: const EdgeInsets.all(5.0),
                                  //         child: Container(
                                  //           width: 15,
                                  //           height: 15,
                                  //           color: Colors.blue,
                                  //         ),
                                  //       ),
                                  //       Padding(
                                  //         padding: const EdgeInsets.all(5.0),
                                  //         child: Container(
                                  //           width: 15,
                                  //           height: 15,
                                  //           color: Colors.red,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   children: [
                                  //     Row(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.center,
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Text(
                                  //           'Size',
                                  //           style: TextStyle(
                                  //               color: Colors.grey,
                                  //               fontSize: 16),
                                  //         ),
                                  //         Row(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.end,
                                  //           children: [
                                  //             Padding(
                                  //               padding: const EdgeInsets.only(
                                  //                   top: 8.0),
                                  //               child: SvgPicture.asset(
                                  //                   'assets/svg/ruler.svg',
                                  //                   width: 30,
                                  //                   height: 40,
                                  //                   alignment:
                                  //                       Alignment.topRight),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 5,
                                  //             ),
                                  //             Text(
                                  //               'Size Chart',
                                  //               style: TextStyle(
                                  //                 color: Colors.red
                                  //                     .withOpacity(0.8),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //     SizedBox(
                                  //       height: 5,
                                  //     ),
                                  //     Container(
                                  //       width:
                                  //           MediaQuery.of(context).size.width,
                                  //       height: 50,
                                  //       child: ListView(
                                  //         scrollDirection: Axis.horizontal,
                                  //         children: [
                                  //           Padding(
                                  //             padding:
                                  //                 const EdgeInsets.all(5.0),
                                  //             child: Container(
                                  //               width: 75,
                                  //               height: 10,
                                  //               child: Center(
                                  //                 child: Text('S'),
                                  //               ),
                                  //               decoration: BoxDecoration(
                                  //                   border: Border.all(
                                  //                       color: Colors.black26)),
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding:
                                  //                 const EdgeInsets.all(5.0),
                                  //             child: Container(
                                  //               width: 75,
                                  //               height: 10,
                                  //               child: Center(
                                  //                 child: Text('M'),
                                  //               ),
                                  //               decoration: BoxDecoration(
                                  //                   border: Border.all(
                                  //                       color: Colors.black26)),
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding:
                                  //                 const EdgeInsets.all(5.0),
                                  //             child: Container(
                                  //               width: 75,
                                  //               height: 10,
                                  //               child: Center(
                                  //                 child: Text('L'),
                                  //               ),
                                  //               decoration: BoxDecoration(
                                  //                   border: Border.all(
                                  //                       color: Colors.black26)),
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding:
                                  //                 const EdgeInsets.all(5.0),
                                  //             child: Container(
                                  //               width: 75,
                                  //               height: 10,
                                  //               child: Center(
                                  //                 child: Text('XL'),
                                  //               ),
                                  //               decoration: BoxDecoration(
                                  //                   border: Border.all(
                                  //                       color: Colors.black26)),
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            true
                                ? Container(
                                    height: 20,
                                    child: Center(
                                      child: Text('No Options for this item'),
                                    ),
                                  )
                                : Container(),
                            // : Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 8.0, right: 8, bottom: 8),
                            //     child: Container(
                            //       height:
                            //           180 * attributes.length.toDouble(),
                            //       width: MediaQuery.of(context).size.width,
                            //       child: ListView.builder(
                            //         itemCount: attributes.length,
                            //         physics: NeverScrollableScrollPhysics(),
                            //         itemBuilder: (context, index) =>
                            //             AttributeCollection(
                            //           attributesCollection:
                            //               attributes[index],
                            //           title: attributesNames[index],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
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
                                  left: 15, right: 15, bottom: 5.0, top: 10),
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
                                          text:
                                              "Choose to return or exchange for different size available within ",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: "15 days",
                                          style:
                                              TextStyle(color: instaTextColor),
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
                                  // 'Choose to return or exchange for different size available within ' + '',
                                  // maxLines: 10,
                                  // style: TextStyle (
                                  //     fontSize: 15,
                                  //     color: kTextColor,
                                  // ),
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
                                                      })
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
                                                      })
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  productAppBar(context,widget.item.productId),
                  Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () => {
                        setState(() => loading = true),
                        HttpServices.updateCartItem(widget.item.id,
                                widget.item.productId, quantity, context)
                            .then((value) => {setState(() => loading = false)})
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
}
