import 'package:flutter/material.dart';
import 'package:hodhod_mart/model/SubCategoryProducts.dart';

import 'package:hodhod_mart/screens/homePage/components/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeBody();
  }
}
