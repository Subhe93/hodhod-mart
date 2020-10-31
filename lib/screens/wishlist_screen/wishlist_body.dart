import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:hodhod_mart/provider/wishList_provider.dart';
import 'package:hodhod_mart/screens/wishlist_screen/wishList_card.dart';
import 'package:provider/provider.dart';

class WishListBody extends StatefulWidget {
  @override
  _WishListBodyState createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 10),
          children: Provider.of<WishListProvider>(context,listen: false).wishList.map((WishListItem value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(child: WishListCard(wishList: value,)),
                Divider()
              ],
            );
          }).toList(),
        ),
      ],),
    );
  }
}
