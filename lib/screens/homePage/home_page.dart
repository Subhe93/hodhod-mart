import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/homePage/components/appBar.dart';
import 'package:hodhod_mart/screens/homePage/components/bottom_app_bar.dart';
import 'package:hodhod_mart/screens/homePage/components/home_body.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeBody ();
  }
}
