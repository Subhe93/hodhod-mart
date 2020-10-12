import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/checkout/body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, false, 'CHECKOUT', false),
      body: CheckoutBody(),
    );
  }
}
