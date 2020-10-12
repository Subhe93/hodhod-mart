import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/start_page.dart';

import 'screens/checkout/checkout.dart';
import 'screens/track_order/track_order.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      // home : Checkout(),
      home: StartPage(),

  ),
  );
}
