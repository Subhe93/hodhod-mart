import 'package:flutter/material.dart';

import 'package:hodhod_mart/provider/wishList_provider.dart';
import 'package:hodhod_mart/screens/start_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WishListProvider>(
            create: (_) => WishListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: StartPage(),
      ),
    ),
  );
}
