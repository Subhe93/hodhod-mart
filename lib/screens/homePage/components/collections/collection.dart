import 'package:flutter/material.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/repositories/collection_repository.dart';
import 'package:hodhod_mart/screens/homePage/components/collections/collection_list.dart';

class Collection extends StatelessWidget {
  final CollectionRepository collectionCard;

  const Collection({Key key, this.collectionCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 30.0 , bottom: 5 ),
      child: Container(
        height: 310,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text (
                    collectionCard.name,
                    style: TextStyle (
                      color: kTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),),
                  InkWell (
                    child: Text (
                      'MORE',
                      style: TextStyle (
                        color: kTextPurpleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),),
                  )
                ],
              ),
            ),
            CollectionList(collectionList: collectionCard.collectionList,),
          ],
        ),
      ),
    );
  }
}
