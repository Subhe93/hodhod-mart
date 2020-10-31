import 'package:flutter/material.dart';
import 'package:hodhod_mart/provider/wishList_provider.dart';
import 'package:hodhod_mart/screens/start_page.dart';
import 'package:provider/provider.dart';

import 'screens/checkout/checkout.dart';
import 'screens/track_order/track_order.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WishListProvider>(create: (_) => WishListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        // home : Checkout(),
        home: StartPage(),

  ),
    ),
  );
}
