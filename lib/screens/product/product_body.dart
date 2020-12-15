import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/Manager/Manager.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/ProductDetails.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/presentation/my_flutter_app_icons.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:html/parser.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class ProductBody extends StatefulWidget {
  final int id;
  List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];

  ProductBody({Key key, this.id}) : super(key: key);

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  ProductDetails product;
  int quantity;
  bool loadingScreen;
  bool addingItemToCart;
  bool added;
  bool addingToWishList;
  bool _showPreview;
  String _image;
  int total;
  List<int> options;
  List<List<Attribute>> attributes;
  List<String> attributesNames;
  @override
  void initState() {
    _showPreview = false;
    _image = "";
    addingToWishList = false;
    loadingScreen = true;
    addingItemToCart = false;
    quantity = 0;
    options = [];
    total = 0;

    attributes = [];
    attributesNames = [];
    super.initState();
    HttpServices.getProductDetails(widget.id, context).then((value) => {
          if (mounted)
            {
              setState(() => {loadingScreen = false, product = value}),
              if (value.attributes != null)
                {
                  attributesNames = value.attributes.keys.toList(),
                  attributes = value.attributes.values.toList(),
                  for (var attribute in attributes)
                    {
                      attribute[0].selected = true,
                      total + attribute[0].addToPrice
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
      body: loadingScreen
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
                                          product.name,
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
                                        child: Swiper(
                                          autoplay: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return new Image.network(
                                              baseUrl + product.images[index],
                                              fit: BoxFit.fill,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      child: LoadingIndicator(
                                                        indicatorType:
                                                            Indicator.ballScale,
                                                        color: signInEndColor,
                                                      )),
                                                );
                                              },
                                            );
                                          },
                                          itemCount: product.images.length,
                                          pagination: SwiperPagination(
                                            builder: DotSwiperPaginationBuilder(
                                                color: Colors.amber,
                                                activeColor: kTextPurpleColor),
                                            alignment: Alignment.bottomCenter,
                                          ),
                                          control: new SwiperControl(
                                            color: Colors.transparent,
                                          ),
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
                                      product.name,
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
                                            '${product.price}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '${product.price}',
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(parse(product.description)
                                      .documentElement
                                      .text),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Theme(
                                    data:
                                        ThemeData(accentColor: signInEndColor),
                                    child: ExpansionTile(
                                      expandedAlignment: Alignment.centerLeft,
                                      title: Text(
                                        Applocalizations.of(context)
                                            .translate("Offers and Discounts"),
                                        style: TextStyle(color: signInEndColor),
                                      ),
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Applocalizations.of(context)
                                                  .translate(
                                                      "Discount Description"),
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Text(parse(
                                                    product.discountDescription)
                                                .documentElement
                                                .text),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                Applocalizations.of(context)
                                                    .translate(
                                                        "Offer Description"),
                                                style: TextStyle(fontSize: 17)),
                                            Text(parse(product.offerDescription)
                                                .documentElement
                                                .text),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        Applocalizations.of(context)
                                            .translate("Options :"),
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
                                      child: Text(Applocalizations.of(context)
                                          .translate(
                                              "No Options for this item")),
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
                                  Container(
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              Applocalizations.of(context)
                                                  .translate("Quantity"),
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
                                                        getTotal()
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
                                  Container(
                                    height: 70,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              Applocalizations.of(context)
                                                  .translate("Total"),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: signInStartColor,
                                                  fontWeight: FontWeight.bold)),
                                          Text(total.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: signInEndColor,
                                                  fontWeight: FontWeight.bold))
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
                          ],
                        ),
                      ),
                    ),
                  ),
                  productAppBar(context),
                  if (_showPreview) ...[
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            _image,
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  ],
                  addingItemToCart
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 0,
                          width: 0,
                        ),
                  addingItemToCart
                      ? Container(
                          height: 0,
                          width: 0,
                        )
                      : Positioned(
                          bottom: 0,
                          child: InkWell(
                            onTap: () => {
                              Provider.of<ModelsProvider>(context,
                                          listen: false)
                                      .isLoggedin()
                                  ? addToCart()
                                  : Manager.openRegisterSheet(context)
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              color: Colors.deepPurple,
                              child: Center(
                                  child: Text(
                                Applocalizations.of(context)
                                    .translate("Add To Cart"),
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

  ///
  ///
  ///
  ///
//validation and processing selected attributes
  void addToCart() {
    options = [];
    if (quantity > 0) {
      for (var i = 0; i < attributes.length; i++) {
        for (var sub in attributes[i]) {
          if (sub.selected) {
            options.add(sub.id);
          }
        }
      }
      setState(
        () => addingItemToCart = true,
      );
      HttpServices.addItemToCart(
              options.toString(), product.id, quantity, context)
          .then((value) => {
                setState(
                  () => addingItemToCart = false,
                )
              });
    } else {
      Manager.toastMessage(
          Applocalizations.of(context).translate("Please choose a Quantity"),
          Colors.red);
    }
  }

////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  Widget productAppBar(BuildContext context) {
    double containerHeight = 40;
    double containerWidth = 40;
    double imageRadius = 20;

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 40),
      child: Container(
        color: Colors.transparent,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(imageRadius),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: appBarIconsColor,
                  size: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: containerWidth,
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(imageRadius),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<ModelsProvider>(context, listen: false)
                              .isLoggedin()
                          ? addToCart()
                          : Manager.openRegisterSheet(context);
                    },
                    icon: Icon(
                      MyFlutterApp.cart_04,
                      color: appBarIconsColor,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                addingToWishList
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator())
                    : Container(
                        width: containerWidth,
                        height: containerHeight,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(imageRadius),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (!Provider.of<ModelsProvider>(context,
                                    listen: false)
                                .isLoggedin()) {
                              Manager.openRegisterSheet(context);
                            } else {
                              setState(() {
                                addingToWishList = true;
                              });
                              HttpServices.addItemToWishlist(
                                      product.id, context)
                                  .then((value) => {
                                        setState(
                                            () => {addingToWishList = false})
                                      });
                            }
                          },
                          icon: Icon(
                            MyFlutterApp.love_02,
                            color: appBarIconsColor,
                            size: 20,
                          ),
                        ),
                      ),
              ],
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

////
  ///
  ///
  ///
  ///   Attribute Card
  Widget AttributeCard(Attribute attribute, int collectionIndex) {
    return GestureDetector(
      onTap: () => {
        for (int i = 0; i < attributes[collectionIndex].length; i++)
          {attributes[collectionIndex][i].selected = false},
        setState(() => {
              // attribute.selected
              //     ? attribute.selected = false
              //     :

              attribute.selected = true,
              getTotal()
            })
      },
      onLongPress: () {
        setState(() {
          _showPreview = true;
          _image = baseUrl + attribute.image;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          _showPreview = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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

////
  ///
  ///
  ///
  ///   Attribute Card
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
