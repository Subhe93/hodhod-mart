import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hodhod_mart/constants.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/model/whoshlist_model.dart';
import 'package:hodhod_mart/networking_http/services_http.dart';
import 'package:hodhod_mart/provider/modelsProvider.dart';

import 'package:hodhod_mart/screens/wishlist_screen/wishList_card.dart';
import 'package:provider/provider.dart';

class WishListBody extends StatefulWidget {
  @override
  _WishListBodyState createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  bool loading;

  @override
  void initState() {
    super.initState();
    loading = true;
    HttpServices.getWishList(context).then((value) => {
          if (mounted)
            {
              setState(() => {loading = false})
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    List<WishListItem> wishlistItems =
        Provider.of<ModelsProvider>(context, listen: true).wishlistItems;
    return SingleChildScrollView(
      child: Column(
        children: [
          loading
              ? Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : wishlistItems.isEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Applocalizations.of(context).translate(
                                "Your WishList is Empty",
                              ),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: signInStartColor),
                            ),
                            Icon(
                              FontAwesomeIcons.sadCry,
                              color: signInStartColor,
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: wishlistItems.length,
                      itemBuilder: (context, index) => WishListCard(
                        item: wishlistItems[index],
                        index: index,
                      ),
                    ),
        ],
      ),
    );
  }
}
