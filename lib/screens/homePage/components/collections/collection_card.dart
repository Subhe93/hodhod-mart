import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hodhod_mart/repositories/collection_card_repository.dart';

class CollectionCard extends StatelessWidget {
  final CollectionCardRepository collectionCardItem;

  const CollectionCard({Key key, this.collectionCardItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 140,
      decoration: BoxDecoration (
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 15, top: 15, right: 10 , bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                    collectionCardItem.image,
                width: 140,
                height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius:
                        BorderRadius.only(
                            bottomLeft: Radius.circular(50),),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(1, 0),

                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text (
                          collectionCardItem.discount,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle (
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text (
                          'OFF',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle (
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 6.0, 0.0, 0.0),
            child: Text (
                collectionCardItem.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle (
              fontWeight: FontWeight.w500,
            ),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0 , 6.0 , 0.0 ,0),
            child: RatingBar (
              initialRating: collectionCardItem.rate,
              itemSize: 12,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0 , 6.0 , 0 ,0),
            child: Text (
                collectionCardItem.price,
              overflow: TextOverflow.ellipsis,
              style: TextStyle (
                fontWeight: FontWeight.w500,
              ),),
          ),
        ],
      ),
    );
  }
}
