import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'package:provider/provider.dart';

import '../../../../constants.dart';

class CollectionCard extends StatefulWidget {
  final Product product;

  const CollectionCard({Key key, this.product}) : super(key: key);

  @override
  _CollectionCardState createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  @override
  Widget build(BuildContext context) {
    bool test = true;
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 15, top: 15, right: 5, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 240,
                    height: 200,
                    fit: BoxFit.fill,
                    imageUrl: widget.product.mainImage != ""
                        ? baseUrl + widget.product.mainImage
                        : 'https://picsum.photos/200/300.jpg',
                    placeholder: (context, url) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballScale,
                            color: signInStartColor,
                          ),
                        ),
                      ],
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )

                  //  Image.network(
                  //   widget.product.mainImage != ""
                  //       ? baseUrl + widget.product.mainImage
                  //       : 'https://picsum.photos/200/300.jpg',
                  //   width: 240,
                  //   height: 200,
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              Positioned(
                top: 2,
                right: 2,
                child: InkWell(
                  child: Icon(
                    // test?Icons.favorite:
                    Icons.favorite_border,
                    color: test ? Colors.deepOrange : signInStartColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 6.0, 0.0, 0.0),
            child: Container(
              width: 240,
              child: Text(
                widget.product.name,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontFamily: 'Anago',
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 6.0, 0.0, 0),

            // child: RatingBar(
            //   initialRating: collectionCardItem.rate,
            //   itemSize: 12,
            //   itemBuilder: (context, _) => Icon(
            //     Icons.star,
            //     color: Colors.amber,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 6.0, 0, 0),
            child: RichText(
              text: TextSpan(
                  text: Applocalizations.of(context)
                      .translate("Price Starting From "),
                  style: TextStyle(
                      fontFamily: 'Anago',
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.product.price.toString(),
                        style: TextStyle(
                            color: signInEndColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5)),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Chip(
                  backgroundColor: signInEndColor,
                  label: Text(
                    widget.product.status == 'active'
                        ? Applocalizations.of(context)
                            .translate("Always in stock")
                        : Applocalizations.of(context)
                            .translate("Not available"),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Anago',
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.5,
                ),
                // Chip(
                //   backgroundColor: signInStartColor,
                //   label: Text(
                //     'fast delivery',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 10,
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
