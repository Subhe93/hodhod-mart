import 'package:flutter/material.dart';
import 'package:hodhod_mart/screens/my_account/component/app_bar.dart';
import 'package:hodhod_mart/screens/my_account/edit_account_info/body.dart';

class EditAccountInfo extends StatefulWidget {
  @override
  _EditAccountInfoState createState() => _EditAccountInfoState();
}

class _EditAccountInfoState extends State<EditAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditAccountInfoBody(),
      appBar: accountAppBar(context, false, 'Edit Information', false),
    );
  }
}

