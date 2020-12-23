import 'package:flutter/material.dart';
import 'package:hodhod_mart/localization/app_localization.dart';
import 'package:hodhod_mart/screens/my_account/add_address/body.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountAppBar(context, false,   Applocalizations.of(context).translate("Add New Address"), false),
      body: AddAddressBody(),
    );
  }
}
