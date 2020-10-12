import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/track_order/body.dart';

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white54.withOpacity(0.9),
      appBar: accountAppBar(context, false, 'Track Order', false),
      body: TrackOrderBody(),
    );
  }
}
