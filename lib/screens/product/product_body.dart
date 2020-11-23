import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/model/ProductsDetails.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';
import 'package:hodhod_mart/screens/product/components/app_bar.dart';

class ProductBody extends StatefulWidget {
  final int id;
  List<String> swiperList = ['ad1.png', 'ad2.png', 'ad3.png'];

  ProductBody({Key key, this.id}) : super(key: key);

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  ProductDetails product;
  bool loading;
  List<List<Attribute>> attributes;
  List<String> attributesNames;
  @override
  void initState() {
    loading = true;
    attributes = [];
    attributesNames = [];
    super.initState();
    HttpServices.getProductDetails(widget.id, context).then((value) => {
          if (mounted)
            {
              setState(() => {loading = false, product = value}),
              if (value.attributes != null)
                {
                  attributesNames = value.attributes.keys.toList(),
                  print(attributesNames),
                  attributes = value.attributes.values.toList(),
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
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Color',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.share),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 25,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            width: 15,
                                            height: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Size',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: SvgPicture.asset(
                                                    'assets/svg/ruler.svg',
                                                    width: 30,
                                                    height: 40,
                                                    alignment:
                                                        Alignment.topRight),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Size Chart',
                                                style: TextStyle(
                                                  color: Colors.red
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 75,
                                                height: 10,
                                                child: Center(
                                                  child: Text('S'),
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 75,
                                                height: 10,
                                                child: Center(
                                                  child: Text('M'),
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 75,
                                                height: 10,
                                                child: Center(
                                                  child: Text('L'),
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                width: 75,
                                                height: 10,
                                                child: Center(
                                                  child: Text('XL'),
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black26)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 165 * attributes.length.toDouble(),
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  itemCount: attributes.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      AttributeCollection(
                                    attributesCollection: attributes[index],
                                    title: attributesNames[index],
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  productAppBar(context),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.deepPurple,
                      child: Center(
                          child: Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class AttributeCollection extends StatelessWidget {
  final List<Attribute> attributesCollection;
  final String title;
  const AttributeCollection({Key key, this.attributesCollection, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                AttributeCard(attribute: attributesCollection[index]),
          ),
        ),
      ],
    );
  }
}

class AttributeCard extends StatelessWidget {
  final Attribute attribute;

  const AttributeCard({Key key, this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(border: Border.all(width: 0.5)),
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
    );
  }
}
