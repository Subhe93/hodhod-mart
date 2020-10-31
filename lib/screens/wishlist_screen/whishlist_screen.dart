import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/wishlist_screen/wishlist_body.dart';

class WhishList extends StatefulWidget {
  @override
  _WhishListState createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WishListBody(),
    );
  }
}
