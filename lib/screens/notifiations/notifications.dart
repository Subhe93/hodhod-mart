import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/notifiations/body.dart';


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, false, 'Notifications' , false),
      body: NotificationsBody(),
    );
  }
}
