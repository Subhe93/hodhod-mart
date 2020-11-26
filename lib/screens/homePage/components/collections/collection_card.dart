import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';

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
      margin: EdgeInsets.only(left: 15, top: 15, right: 10, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.product.mainImage != ""
                      ? baseUrl + widget.product.mainImage
                      : 'https://picsum.photos/200/300.jpg',
                  width: 240,
                  height: 200,
                  fit: BoxFit.cover,
                ),
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
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400,
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
                  text: 'Price Starting From ',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w500),
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
                    'Always in stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.5,
                ),
                Chip(
                  backgroundColor: signInStartColor,
                  label: Text(
                    'fast delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
