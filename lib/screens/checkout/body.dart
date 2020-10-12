import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/checkout/order_checkout.dart';
import 'package:hodhod_mart/screens/checkout/payment_checkout.dart';
import 'package:hodhod_mart/screens/checkout/shipping_checkout.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CheckoutBody extends StatefulWidget {
  @override
  _CheckoutBodyState createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController (
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar (
            backgroundColor: Colors.red,
            toolbarHeight: 50,
            bottom: TabBar (
              indicator: UnderlineTabIndicator (
                insets: EdgeInsets.only(left: 20 , right: 20 , top: 0 , bottom: 46),
                borderSide: BorderSide(color: Colors.amber , width: 4),
              ),
              indicatorColor: Colors.amber,
              tabs: [
                Tab(
                  child: Text (
                    'Shipping',
                    style: TextStyle (
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  // text: 'Shipping',
                ),
                Tab(
                  child: Text (
                    'Order',
                    style: TextStyle (
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  // text: 'Shipping',
                ),
                Tab(
                  child: Text (
                    'Payment',
                    style: TextStyle (
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  // text: 'Shipping',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ShippingCheckout(),
              OrderCheckout(),
              PaymentCheckout(),
            ],
          ),
        ),
    );
  }
}
