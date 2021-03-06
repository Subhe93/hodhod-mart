import 'package:flutter/material.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/my_cart/body.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: accountAppBar(context, false,
          Applocalizations.of(context).translate("My Cart"), true),
      body: Stack(children: [
        NewCartBody(),
      ]),
    );
  }
}
