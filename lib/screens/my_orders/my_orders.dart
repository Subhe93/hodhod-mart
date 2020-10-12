import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/my_orders/body.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, false , 'MY ORDER' , false),
      body: MyOrdersBody(),
    );
  }
}
