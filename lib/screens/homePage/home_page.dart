import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hodhod_mart/networking_http/services_http.dart';

import 'package:hodhod_mart/screens/homePage/components/home_body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading;
  @override
  void initState() {
    loading = true;
    super.initState();
    HttpServices.getHomeData(context).then((value) => {
          setState(() => loading = false),
        });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : HomeBody();
  }
}
