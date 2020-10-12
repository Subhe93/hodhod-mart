import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class MyAccount extends StatefulWidget {


  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context , true , 'MY ACCOUNT' , false),
      body: MyAccountBody(),
    );
  }
}
