import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/cart/cart_body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: accountAppBar(context, false, 'My Cart', true),
      body: NewCartBody(),
    );
  }
}
